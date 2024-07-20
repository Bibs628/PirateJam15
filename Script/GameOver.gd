extends Control
@export var button: Button

func _ready():
	button.pressed.connect(new_game)


func new_game():
	print("Neues Spiel wird gestartet.")
	get_tree().change_scene_to_file("res://Scenes/Game.tscn")
	
