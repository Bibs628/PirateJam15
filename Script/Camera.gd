extends Camera2D

@export var start_offset: float = 800


func _ready():
	position.x += start_offset
	position.y = position.y - start_offset * 0.4