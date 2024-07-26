@tool
class_name FireWeapon
extends CharacterBody2D

@export var projectile_speed: int = 400
var weapon_direction: Vector2 = Vector2(0, 0)
var vector_to_mouse: Vector2 = Vector2(0, 0)
var weapon_position = Vector2(0, 0)


func _ready():
	global_position = weapon_position


func send_fireball(mouse, max_fireball_distance):
	weapon_position += mouse * projectile_speed


func _physics_process(delta):
	velocity = vector_to_mouse
	#velocity = Vector2(mouse, -projectile_speed).rotated(weapon_rotation)
	move_and_slide()
