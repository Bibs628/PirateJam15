extends Control


func _ready():
	# Holt die Nodes von den anderen Szenen.
	var game = get_tree().get_nodes_in_group("State_Listeners")
	game[0].alchemist_died.connect(game_over)


func game_over():
	visible = true


func on_button_pressed():
	print("Neues Spiel wird gestartet.")
	get_tree().change_scene_to_file("res://Scenes/Game.tscn")
