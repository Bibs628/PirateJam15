extends Node2D

var over: Control
@export var game_over: Control 
@export var player: CharacterBody2D

# Called when the node enters the scene tree for the first time.
func _ready():
	game_over.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if player.health_points == 0:
		game_over.visible = true
