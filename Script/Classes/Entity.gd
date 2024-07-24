class_name Entity
extends CharacterBody2D
## Jedes lebende Objekt ist eine Entity.
## Dazu zaehlen Spieler, NPCs, und Mobs.

@export_group("Eigenschaften")
@export var speed: int = 300
@export var jump_velocity: int = -400
@export var health_points: int = 3;

@onready var animation: AnimationPlayer = $AnimationPlayer
@onready var sound: AudioStreamPlayer2D = $AudioStreamPlayer2D

var gravity: float = ProjectSettings.get_setting("physics/2d/default_gravity")


func _init(entity_name: String = "Entity"):
	print("Entity \"%s\" spawned." % entity_name)


func _physics_process(delta):
	if health_points <= 0:
		velocity = Vector2.ZERO
	else:
		move_and_slide()
	
	if not is_on_floor():
		velocity.y += gravity * delta
	
	if position.y > 1080:
		_take_damage(3)
		position.y = 1079
		

func _deal_damage():
	# TODO: Entity uebt Schaden aus.
	animation.play("Attack")
	emit_signal("Attack")


func _take_damage(dmg: int):
	health_points -= dmg
	animation.play("Defense")
	emit_signal("Defense")
	print("DONE")
	
	if health_points < 0: 
		health_points = 0
