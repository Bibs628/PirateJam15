extends Control

@export var player: CharacterBody2D
@export var panel: Panel

func _ready():
	var alch_status = get_container("AlchStatus")
	for i in range(alch_status.size()):
		alch_status[i].visible = i == 0


func health_bar_manager(health_points):
	var alch_hp = get_container("AlchHP")
	for i in range(alch_hp.size()):
		alch_hp[i].visible = i < health_points


func alchemist_status_manager(status):
	var alch_status = get_container("AlchStatus")
	for i in range(alch_status.size()):
		alch_status[i].visible = i == status


func get_container(container: String) -> Array:
	return panel.get_node("UI").get_node(container).get_node("HBoxContainer").get_children()
