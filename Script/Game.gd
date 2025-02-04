class_name Game
extends Node2D
## Diese Klasse kommuniziert mit allen anderen Scripts.

# Empfaenger und Sender
@onready var player: Player = $Player
@onready var weapon: Hitbox = player.get_node("ContextWeapon")

@onready var user_interface: CanvasLayer = $Interface
@onready var gui: Control = user_interface.get_node("GUI")
@onready var tutorial: Control = gui.get_node("Tutorial").get_node("Panel")
@onready var game_over: Control = user_interface.get_node("GameOver")

@onready var monster = $Monster
@onready var monster_fireball = null
@onready var player_fireball = null


"""
Empfaenger: UI
"""
## Sender: Player
func alchemist_died():
	game_over.game_over()


func alchemist_hp_change(health_points: int):  
	gui.health_bar_manager(health_points)


func alchemist_element_change(status: int):
	gui.alchemist_status_manager(status)


func change_tutorial_stage(tutorial_index: int):
	tutorial.get_child(tutorial_index).visible = false
	if tutorial_index <= 2:
		tutorial.get_child(tutorial_index + 1).visible = true
	if tutorial_index == 3:
		tutorial.visible = false


## Sender: Monster
func monster_died():
	gui.monster_bar_manager(0)


func monster_hp_change(dmg: int):
	gui.monster_bar_manager(dmg)



"""
Empfaenger: PlayerWeapon
"""
## Sender: Player
func send_mouse_position(mouse: Vector2, max_fireball_distance: int):
	
	if monster:
		weapon.throw_fireball(mouse, max_fireball_distance)


func won_game(body):
	if body.name == "Player":
		call_deferred("change_to_win_screen")


func change_to_win_screen():
	get_tree().change_scene_to_file("res://Scenes/GameWon.tscn")
