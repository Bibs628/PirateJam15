class_name Entity
extends CharacterBody2D

@export_group("Eigenschaften")
@export var speed: int = 300
@export var jump_velocity: int = -400
@export var health_points: int = 3;
@export var animation: AnimationPlayer

var gravity: float = ProjectSettings.get_setting("physics/2d/default_gravity")


func _init(name: String = "Entity"):
	print("Entity \"%s\" spawned." % name)


func _deal_damage():
	# TODO: Entity uebt Schaden aus.
	animation.play("Attack")
	emit_signal("Attack")


func _take_damage(dmg: int):
	health_points -= dmg
	animation.play("Defense")
	emit_signal("Defense")
	
	if health_points < 0: health_points = 0
