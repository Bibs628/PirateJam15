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


func throw_fireball(mouse: Vector2, max_fireball_distance: int):
	visible = true
	print(global_position)
	var fireball = fire_weapon.instantiate()
	var mouse_translate = Vector2(500, 500)
	fireball.weapon_position = global_position
	fireball.weapon_rotation = global_position.angle_to(mouse_translate)
	print(fireball.weapon_rotation)
	add_child.call_deferred(fireball)
