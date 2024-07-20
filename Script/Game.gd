extends Node2D

@export var game_over: Control 
@export var player: CharacterBody2D

signal game_over_signal

func _ready():
	game_over.visible = false


func _process(_delta):
	if player.health_points == 0:
		emit_signal("game_over_signal")


func player_alchemist_status(status):
	#TODO: Alchemist Status
	if status == "Normal":
		pass
