class_name Terrain
extends Node
## Jeder nicht-lebende, nicht-interagierbare Block
## ist Teil der Klasse Terrain.

enum Terrain {
	SOLID,
	MOVING,
	DMG,
	DMG_MOVING
}

func _ready():
	print("Environment Objekt spawned.")


func dmg_terrain():
	#TODO: Terrain, das Schaden verursacht
	pass


func moving_terrain():
	#TODO: Terrain, das sich bewegt
	pass
