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
	mouse = Vector2(500, 500)
	'''var skp = global_position.dot(mouse)
	var laenge = mouse.length() * global_position.length()
	var winkel = skp / laenge
	print("Winkel: %s" % winkel)'''
	#global_position.angle_to_point(mouse)

	fireball.weapon_position = global_position
	#fireball.weapon_rotation = winkel
	fireball.weapon_rotation = global_position.angle_to_point(mouse)
	print(fireball.weapon_rotation)
	add_child.call_deferred(fireball)
