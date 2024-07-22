class_name Terrain
extends Node
## Jeder nicht-lebende, nicht-interagierbare Block
## ist Teil der Klasse Terrain.

signal damage_tile

enum Terrain {
	SOLID,
	MOVING,
	DMG,
	DMG_MOVING
}


func _init(terrain_name: String = "Block"):
	print("Terrain \"%s\" spawned." % terrain_name)

func _ready():
	print("Environment Objekt spawned.")


func dmg_terrain():
	#TODO: Terrain, das Schaden verursacht
	emit_signal("damage_tile")
	pass


func moving_terrain():
	#TODO: Terrain, das sich bewegt
	pass
