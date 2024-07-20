extends Camera2D

@export var start_offset: float = 800
@export var center_speed: float = 1
var last_x:float
@export var player: CharacterBody2D

func _ready():
	position.x = player.position.x + start_offset
	position.y = player.position.y + start_offset / 6


func _process(_delta):
	#TODO: Komplettes Rewrite der _process-Funktion.
	#TODO: Mathematisches Angleichen der Kamera
	#TODO: Rueckwaertsfunktion fuer Backtracking (Left/Right Input?)
	'''	var center_camera = player.position.x + start_offset / 3
	
	if (player.position.x > 0):
		var target_x = player.position.x + start_offset
		var offset = clamp(player.position.x / start_offset, 0, 1) * start_offset
		position.x = lerp(position.x, target_x - offset, center_speed)
		last_x = player.position.x
		position.x = center_camera
	else:
		position.x = start_offset'''
	#if player.position.x > 0:
	#	position.x = player.position.x + start_offset
	#debug()
	
func debug():
	await get_tree().create_timer(2).timeout 
	print("Player: ", player.position.x, " | Camera: ", position.x)
