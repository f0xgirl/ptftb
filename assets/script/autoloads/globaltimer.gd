extends Timer

var time: float = 1

func _ready() -> void:
	timeout.connect(mainmenu)

func _process(_delta: float) -> void:
	time = wait_time

func mainmenu():
	get_tree().change_scene_to_file("res://assets/scenes/level_select.tscn")
	DataPassthrough.player_pos_x = 0
	DataPassthrough.player_pos_y = 0
	DataPassthrough.panic = false
	stop()
