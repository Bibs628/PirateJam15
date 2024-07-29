class_name Monster
extends Entity

var aware_of_player = false
@onready var player_node = get_tree().get_nodes_in_group("Player")
@onready var player = player_node[0]

func _init():
	super._init("Monster")
	entity_can_fly = true
	

func _physics_process(delta):
	super._physics_process(delta)
	if aware_of_player:
		position += (player.position - position) / speed


func combat_logic():
	#TODO: KI
	pass


func _on_awareness_body_entered(body):
	if not aware_of_player and body == player:
		aware_of_player = true
		print("Monster sieht den Spieler!")
