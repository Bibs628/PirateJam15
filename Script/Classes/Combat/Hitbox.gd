class_name Hitbox
extends Area2D

@export var damage = 1


func is_in_area(area):
	if visible:
		print("Monster attacked!")


func timer_out():
	visible = false
	get_node("CollisionShape2D").disabled = true
	$Timer.stop()
