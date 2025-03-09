extends Node
class_name parent

#signals
signal disable_player
signal enable_player
signal remove
#levels
@export var level_test: Array [PackedScene] = []
@export var level_jg: Array [PackedScene] = []
@export var level_medevial: Array [PackedScene] = [] #idk how to spell it right :sob:
@export var level_ruin: Array [PackedScene] = []
@export var level_dungeon: Array [PackedScene] = []
@export var level_strong: Array [PackedScene] = []
#constants:
const PLAYER = preload("res://assets/scenes/player.tscn")
#can be switched out for the hubs when i get to that
const LEVEL_SELECT = preload("res://assets/scenes/level_select.tscn")
#test level:
const TEST_1 = preload("res://assets/scenes/levels/testing/testing_level.tscn")
#john gutter:
const JG_1 = preload("res://assets/scenes/levels/john gutter/john_gutter_1.tscn")

#variables:
var alreadyloaded: Array [bool] = []

func _ready() -> void:
	alreadyloaded.resize(100) #WHY THE FUCK DO I HAVE TO DO THIS IN MULTIPLE LINES WHY ARE YOU LIKE THIS GODOT
	alreadyloaded.fill(false)
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
	alreadyloaded[0] = true
	GlobalSignals.emit_signal("move", -1605, 269)
	var lvl = JG_1.instantiate()
	add_child(lvl)
	
func load_test():
	print("load test")
	var lvl = TEST_1.instantiate()
	add_child(lvl)
	emit_signal("player_enabled")

func load_room_test(id: int):
	var lvl = level_test[id].instantiate()
	if alreadyloaded[id] == true:
		pass
	else:
		alreadyloaded[id] = true
		add_child(lvl)
	print("alreadyloaded")
	print(alreadyloaded)
	
func load_room_jg(id: int, prev_id: int):
	print("id: " + var_to_str(id) + " prev_id: " + var_to_str(prev_id) + " loaded: " + var_to_str(alreadyloaded))
	if check_if_loaded(prev_id) == false: #for some god forsaken reason ive decided to make this opposite i do not know why this is happening
		GlobalSignals.emit_signal("hide", id)
	elif check_if_loaded(prev_id) == true:
		var lvl = level_jg[id].instantiate()
		add_child(lvl)
		
	

func check_if_loaded(id: int) -> bool:
	if alreadyloaded[id] == true:
		return true
	else:
		alreadyloaded[id] = true
		return false

func clear():
	var x
	for alreadyloaded in x:
		alreadyloaded[x] = null
