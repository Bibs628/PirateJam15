class_name Player
extends Entity
# Script fuer den Alchemisten.

@export_group("Elemente")
@export var current_element = element.FIRE
@export var element_speed = {
	element.FIRE: 400,
	element.PLANT: 500,
	element.WIND: 600,
	element.EARTH: 700,
}
@export var element_jump_velocity = {
	element.FIRE: -400,
	element.PLANT: -400,
	element.WIND: -500,
	element.EARTH: -200
}

signal alchemist_element
signal alchemist_hp(hp: int)
signal alchemist_died
signal menu_trigger

enum element {
		FIRE, 
		PLANT, 
		WIND,
		EARTH
}

@onready var sprite: Sprite2D = $Sprite2D
@onready var weapon: Hitbox = $ContextWeapon


func _init():
	print("Spieler spawned, %s hp." % [health_points])


func _ready():
	speed = element_speed[current_element]
	jump_velocity = element_jump_velocity[current_element]


func _input(_event):
	if Input.is_action_just_pressed("Element Left"):
		change_element((current_element - 1 + element.size()) % element.size())
		
	if Input.is_action_just_pressed("Element Right"):
		change_element((current_element + 1 + element.size()) % element.size())
	
	if Input.is_action_just_pressed("Attack"):
		if current_element == element.FIRE:
			var mouse: Vector2 = get_viewport().get_mouse_position()
			print("Feuerball positioniert auf %s" % mouse)
		$ContextWeapon.visible = true
		$ContextWeapon.get_node("CollisionShape2D").disabled = false
		$ContextWeapon.get_node("Timer").start()


func _physics_process(delta):
	super._physics_process(delta) 

	if position.x < 0: 
		position.x = 0
	
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = jump_velocity
		animation.play("Jump")
		$AudioStreamPlayer2D.play()

	var direction = Input.get_axis("Left", "Right")
	if direction:
		velocity.x = direction * speed
		animation.play("Walk")
		weapon.rotation_degrees = 180 if direction < 0 else 0
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		animation.play("Idle")


func _take_damage(dmg: int):
	health_points -= dmg
	print("Spieler bekam %s Schaden. HP sind %s." % [dmg, health_points])
	alchemist_hp.emit(health_points)
	if health_points <= 0:
		visible = false
		alchemist_died.emit()


func change_element(status: int):
	alchemist_element.emit(status)
	current_element = status as element
	speed = element_speed[status]
	jump_velocity = element_jump_velocity[status]
	print("Element ist nun %s." % current_element)
