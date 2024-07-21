extends Terrain

func _init():
	super._init("Hostile")
	
func _ready():
	pass


func _process(_delta):
	#print(get_node("Area2D").get_overlapping_bodies())
	pass
	
func step_on_terrain():
	emit_signal("damage_tile")
