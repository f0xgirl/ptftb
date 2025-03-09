extends Node
class_name parent

#signals
signal disable_player
signal enable_player
signal remove
#levels,
#also why the fuck are they static i dont want to do it this way
@export var level_test: Array [PackedScene] = []
@export var level_jg: Array [PackedScene] = []



const PLAYER = preload("res://assets/scenes/player.tscn")
# can be switched out for the hubs when i get to that
const LEVEL_SELECT = preload("res://assets/scenes/level_select.tscn")
#test level:
const TEST_1 = preload("res://assets/scenes/levels/testing/testing_level.tscn")
#john gutter:
const JG_1 = preload("res://assets/scenes/levels/john gutter/john_gutter_1.tscn")


func _ready() -> void:
	var plr = PLAYER.instantiate()
	var lvl_select = LEVEL_SELECT.instantiate()
	add_child(plr)
	add_child(lvl_select)
	

func room_called(selected_room: int):
	match selected_room:
		1:
			load_test()
		2:
			print("john gutter laoded")
			load_jg()
		

func room_changed(node: Node) -> void:
	if node == LEVEL_SELECT:
		emit_signal("disable_player")
	else:
		emit_signal("enable_player")
	
## do not use, unfinished
func load_jg():
	var lvl = JG_1.instantiate()
	add_child(lvl)
	
func load_test():
	print("load test")
	var lvl = TEST_1.instantiate()
	add_child(lvl)
	emit_signal("player_enabled")

func load_room_test(id: int):
	var lvl = level_test[id].instantiate()
	add_child(lvl)
	
func load_room_jg(id: int):
	var lvl = level_jg[id].instantiate()
	add_child(lvl)
