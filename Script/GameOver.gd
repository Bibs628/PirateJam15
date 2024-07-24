extends Control


func game_over():
	visible = true


func on_button_pressed():
	print("Neues Spiel wird gestartet.")
	get_tree().change_scene_to_file("res://Scenes/Game.tscn")
