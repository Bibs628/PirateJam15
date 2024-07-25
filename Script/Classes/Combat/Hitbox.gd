class_name Hitbox
extends Area2D

@export var damage = 1
@onready var fire_weapon = load("res://Scenes/FireWeapon.tscn")


func is_in_area(_area):
	if visible:
		print("Monster attackiert!")


func timer_out():
	visible = false
	get_node("CollisionShape2D").disabled = true
	$Timer.stop()


func throw_fireball():
	var fireball = fire_weapon.instantiate()
	fireball.weapon_direction = rotation
	fireball.weapon_position = global_position
