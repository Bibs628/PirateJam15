extends Node2D
class_name Game
## Diese Klasse kommuniziert mit allen anderen Scripts.

# Empfaenger und Sender
@onready var player: Player = $Player
@onready var user_interface: CanvasLayer = $Interface
@onready var gui: Control = $Interface.get_node("GUI")
@onready var game_over: Control = $Interface.get_node("GameOver")
@onready var monster: Array = [$Monster]


### Empfaenger: UI
## Sender: Player
func alchemist_died():
	game_over.game_over()


func alchemist_hp_change(health_points: int):  
	gui.health_bar_manager(health_points)


func alchemist_element_change(status: int):
	gui.alchemist_status_manager(status)
