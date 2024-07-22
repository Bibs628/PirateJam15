extends Control

func _ready():
	alchemist_status_manager(0)


func health_bar_manager(health_points):
	var alch_hp = get_container("AlchHP")
	for i in range(alch_hp.size()):
		alch_hp[i].visible = i < health_points


func alchemist_status_manager(status: int):
	var alch_status = get_container("AlchStatus")
	for i in range(alch_status.size()):
		alch_status[i].custom_minimum_size = Vector2(62, 62) if i == status \
		else Vector2(40, 40)


func monster_bar_manager(health_points):
	var monster_hp = get_container("MobHP")
	for i in range(monster_hp.size()):
		monster_hp[i].visible = i < health_points


func get_container(container: String) -> Array:
	return get_node("TopPanel").get_node("UI") \
	.get_node(container).get_node("HBoxContainer").get_children()
