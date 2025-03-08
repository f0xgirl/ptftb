extends room

var selected_room: int = 0

func _ready() -> void:
	print("working!")
	Audioplayer._play_music_hub()
	

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("up"):
		selected_room -=1
	elif Input.is_action_just_pressed("down"):
		selected_room +=1
	if Input.is_action_just_pressed("action1"):
		print("working!")
		room_called()


func room_called():
	match selected_room:
		1:
			load_test()
		2:
			load_jg()
		


## do not use, unfinished
func load_jg():
	load("res://assets/scenes/levels/john gutter/john_gutter_1.tscn")
	

func load_test():
	print("load test")
	const FIRST_LEVEL = preload("res://assets/scenes/levels/testing/testing_level.tscn")
	load("res://assets/scenes/levels/testing/testing_level_2.tscn")
	var lvl = FIRST_LEVEL.instantiate()
	add_child(lvl)
	get_parent().emit_signal("player_enabled")

func load_clear():
	var x
	for loaded_rooms in x:
		loaded_rooms[x] = null
