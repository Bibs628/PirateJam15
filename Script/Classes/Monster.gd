class_name Monster
extends Entity

var aware_of_player: bool = false
var attacked_by_player: bool = false
var fireball_position: Vector2
var try_to_evade: bool = false
var rng_movement: bool = true
var random_target_position: Vector2
var attack_player: bool = false

@onready var raycast = $RayCast2D
@onready var player_node = get_tree().get_nodes_in_group("Player")
@onready var player = player_node[0]
@onready var hurtbox = $Hurtbox
@onready var fire_weapon = $Other
@export var raycast_distance: int = 250
@export var max_fireball_distance: int = 250

signal monster_hp(hp: int)
signal monster_died

func _init():
	super._init("Monster")
	entity_can_fly = true


func _ready():
	raycast.target_position = Vector2(0, raycast_distance)
	#raycast.add_exception(player)
	hurtbox.connect("area_entered", take_damage)
	$Timer.start()
	

func _physics_process(delta):
	super._physics_process(delta)
	if aware_of_player:
		position += (player.position - position) / speed
		if $WeaponTimer.is_stopped():
			$WeaponTimer.start()
	elif rng_movement:
		position.x += randi_range(-speed, speed) / float(0.5 * speed)
		rng_movement = false

	if health_points <= 0:
		monster_died.emit()

	if raycast.is_colliding():
		flap_wings()

	if try_to_evade:
		position += (fireball_position - position) / speed
		try_to_evade = false
	
	if attacked_by_player and aware_of_player:
		position.x += 3 * (fireball_position.x - position.x) / float(speed)
		try_to_evade = true
		attacked_by_player = false
		
	if attack_player:
		combat_logic()


func random_movement(delta):
	#TODO: Code funktioniert einfach nicht
	var direction = (random_target_position.x - position.x)
	position.x += direction / speed * delta
	
	if abs(position.x - random_target_position.x) <= 1:
		rng_movement = false


func random_movement_timer():
	if not aware_of_player:
		$Timer.start()
		random_target_position.x = randf_range(-speed, speed)
		rng_movement = true


func take_damage(dmg: int):
	super.take_damage(dmg)
	print("SUSSY")
	monster_hp.emit(dmg)
	if health_points <= 0:
		queue_free()


func flap_wings():
	velocity.y = jump_velocity


func combat_logic():
	print("Monster-Feuerball positioniert auf %s." % player.position)
	fire_weapon.throw_fireball(player.position, max_fireball_distance)
	#$WeaponTimer.start()


func on_awareness_body_entered(body):
	if not aware_of_player and body == player:
		aware_of_player = true
		print("Monster sieht den Spieler!")
