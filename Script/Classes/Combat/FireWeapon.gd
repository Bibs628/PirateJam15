class_name FireWeapon
extends CharacterBody2D

@export var projectile_speed: int = -400
var weapon_direction: Vector2 = Vector2(0, 0)
var vector_to_mouse: Vector2 = Vector2(0, 0)
var weapon_position = Vector2(0, 0)
var max_fireball_distance: int = 0
@onready var character = get_parent()

signal monster_dmg
signal player_dmg


func _ready():
	global_position = weapon_position
	rotation_degrees = rad_to_deg(get_angle_to(vector_to_mouse))
	$AudioStreamPlayer2D.play()


func _physics_process(_delta):
	velocity = vector_to_mouse
	if weapon_position.distance_to(global_position) > max_fireball_distance:
		queue_free()
	move_and_slide()


func character_in_area(body):
	if character.name == "Other" and body.name == "Player":
		print("Monster traf Spieler.")
		body.take_damage(1)
	elif character.name == "ContextWeapon" and body.name == "Monster":
		print("Spieler traf Monster.")
		player_dmg.emit()
		body.take_damage(1)
