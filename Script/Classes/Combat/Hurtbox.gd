class_name Hurtbox
extends Area2D


func _on_area_entered(hitbox: Hitbox):
	if owner.has_method("_take_damage"):
		print("Yes.")
		owner._take_damage(hitbox.damage)
	else:
		print("Why?")
	print("Damage done.")
