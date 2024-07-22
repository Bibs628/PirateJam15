class_name Hurtbox
extends Area2D


func _init():
	collision_layer = 0
	collision_mask = 2


func _ready():
	#connect("area_entered", self, "_on_area_entered")
	pass


func _on_area_entered(hitbox: Hitbox):
	if owner.has_method("_take_damage"):
		owner._take_damage(hitbox.damage)
