extends Control
@export var button: Button
@export var player: CharacterBody2D
@export var game: Node2D

func _ready():
	button.pressed.connect(new_game)


func game_over():
	visible = true
	player.get_node("Sprite").visible = false


func new_game():
	print("Neues Spiel wird gestartet.")
	get_tree().change_scene_to_file("res://Scenes/Game.tscn")
