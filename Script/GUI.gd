extends Control

@export var button: Button
@export var player: CharacterBody2D


func _ready():
	button.text = str(player.health_points)


func _process(_delta):
	# TODO: ABSOLUT BESCHISSENE UND HACKY LOESUNG. SO BALD WIE MOEGLICH AENDERN!!!!!!
	button.text = str(player.health_points)
