@tool
class_name FireWeapon
extends CharacterBody2D

@export var projectile_speed: int = -400
var weapon_direction: Vector2 = Vector2(0, 0)
var vector_to_mouse: Vector2 = Vector2(0, 0)
var weapon_position = Vector2(0, 0)
var max_fireball_distance: int = 0


func _ready():
	global_position = weapon_position


func send_fireball(mouse):
	weapon_position += mouse * projectile_speed


func _physics_process(_delta):
	velocity = vector_to_mouse
	if weapon_position.distance_to(global_position) > max_fireball_distance:
		queue_free()
	move_and_slide()