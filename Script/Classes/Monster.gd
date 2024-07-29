class_name Monster
extends Entity

var aware_of_player = false
@onready var raycast = $RayCast2D
@onready var player_node = get_tree().get_nodes_in_group("Player")
@onready var player = player_node[0]

signal monster_hp(hp: int)
signal monster_died

func _init():
	super._init("Monster")
	entity_can_fly = true


func _ready():
	raycast.target_position = Vector2(0, 250)
	

func _physics_process(delta):
	super._physics_process(delta)
	if aware_of_player:
		position += (player.position - position) / speed
	else:
		position.x += randi_range(-speed, speed) / float(0.5 * speed)

	if health_points <= 0:
		monster_died.emit()

	if raycast.is_colliding():
		flap_wings()


func take_damage(dmg: int):
	super.take_damage(dmg)
	monster_hp.emit(dmg)


func flap_wings():
	velocity.y = jump_velocity


func combat_logic():
	#TODO: KI
	pass


func _on_awareness_body_entered(body):
	if not aware_of_player and body == player:
		aware_of_player = true
		print("Monster sieht den Spieler!")
