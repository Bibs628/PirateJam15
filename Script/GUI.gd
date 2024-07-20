extends Control

@export var player: CharacterBody2D
@export var panel: Panel


func health_bar_manager(health_points):
	var container: HBoxContainer = panel.get_node("HBoxContainer")
	var health_bars = container.get_node("AlchHP").get_children()
	for i in range(health_bars.size()):
		health_bars[i].visible = i < health_points
