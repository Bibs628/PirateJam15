extends CanvasLayer

var progress = []
var game: String = "res://Scenes/Game.tscn"
var scene_status = 0
var timer_has_started: bool = false
@onready var status_bars = $Panel.get_node("VBoxContainer")


func _ready():
	ResourceLoader.load_threaded_request(game)


func _process(_delta):
	scene_status = ResourceLoader.load_threaded_get_status(game, progress)
	var scene_int = floor(progress[0] * 100)
	
	if scene_int >= 25:
		status_bars.get_node("Fire").visible = true
	
	if scene_int >= 50:
		status_bars.get_node("Plant").visible = true
	
	if scene_int >= 75:
		status_bars.get_node("Wind").visible = true
	
	if scene_status == ResourceLoader.THREAD_LOAD_LOADED and not timer_has_started:
		timer_has_started = true
		$Timer.start()
		status_bars.get_node("Earth").visible = true


func start_game():
	var switch_scene = ResourceLoader.load_threaded_get(game)
	get_tree().change_scene_to_packed(switch_scene)
