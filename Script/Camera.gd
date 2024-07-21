extends Camera2D

@export var start_offset: float = 800
@export var center_speed: float = 1
@export var player: CharacterBody2D

func _ready():
	position.x = player.position.x + start_offset
	position.y = player.position.y + start_offset / 6


func debug():
	await get_tree().create_timer(2).timeout 
	print("Player: ", player.position.x, " | Camera: ", position.x)
