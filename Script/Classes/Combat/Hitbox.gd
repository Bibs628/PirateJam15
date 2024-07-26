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
	var fireball = fire_weapon.instantiate()
	fireball.weapon_position = global_position
	fireball.vector_to_mouse = (mouse - global_position).normalized() * max_fireball_distance
	fireball.max_fireball_distance = max_fireball_distance

	add_child.call_deferred(fireball, max_fireball_distance)
