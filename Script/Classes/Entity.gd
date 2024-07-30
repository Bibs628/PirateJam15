class_name Entity
extends CharacterBody2D
## Jedes lebende Objekt ist eine Entity.
## Dazu zaehlen Spieler, NPCs, und Mobs.

@export_group("Eigenschaften")
@export var speed: int = 300
@export var jump_velocity: int = -400
@export var health_points: int = 3;
var entity_can_fly: bool = false

@onready var sound: AudioStreamPlayer2D = $AudioStreamPlayer2D

var gravity: float = ProjectSettings.get_setting("physics/2d/default_gravity")

signal Defense

func _init(entity_name: String = "Entity"):
	print("Entity \"%s\" spawned." % entity_name)


func _physics_process(delta):
	if health_points <= 0:
		velocity = Vector2.ZERO
	else:
		move_and_slide()
	
	if not is_on_floor() and not entity_can_fly:
		velocity.y += gravity * delta
	elif not is_on_floor() and entity_can_fly:
		velocity.y += (gravity * delta) * 0.1
	
	if position.y > 1080:
		take_damage(3)
		position.y = 1079
		

func deal_damage():
	# TODO: Entity uebt Schaden aus.
	emit_signal("Attack")


func take_damage(dmg: int):
	health_points -= dmg

	if health_points <= 0: 
		health_points = 0
		visible = false
