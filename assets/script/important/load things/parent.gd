extends Node
class_name parent

#signals
signal remove
#player singals
signal player_limit_left(val: int)
signal player_limit_top(val: int)
signal player_limit_right(val: int)
signal player_limit_bottom(val: int)
signal player_clear_score
#levels
@export var level_test: Array [PackedScene] = []
@export var level_jg: Array [PackedScene] = []
@export var level_medevial: Array [PackedScene] = [] #idk how to spell it right :sob:
@export var level_ruin: Array [PackedScene] = []
@export var level_dungeon: Array [PackedScene] = []
@export var level_strong: Array [PackedScene] = []
@export var level_mid: Array [PackedScene] = []
@export var level_tutorial: Array [PackedScene] = []
#constants:
#can be switched out for the hubs when i get to that
const LEVEL_SELECT = preload("res://assets/scenes/level_select.tscn")
#test level:
const TEST_1 = preload("res://assets/scenes/levels/testing/testing_level.tscn")
#john gutter:
const JG_1 = preload("res://assets/scenes/levels/john gutter/john_gutter_1.tscn")
#pizzascape:
const PIZZASCAPE_1 = preload("res://assets/scenes/levels/pizzascape/pizzascape_1.tscn")
#ancient:
const ANCIENT_1 = preload("res://assets/scenes/levels/ancientcheese/ancient_1.tscn")
#dungeon:
const BLOODSAUCE_1 = preload("res://assets/scenes/levels/dungeon/bloodsauce_1.tscn")
#strongcold:
const STRONGCOLD_1 = preload("res://assets/scenes/levels/strongcold/strongcold_1.tscn")
#midescape:
const MIDESCAPE_1 = preload("res://assets/scenes/levels/midescape/midescape_1.tscn")
#pinball:
const SPACE_PINBALL = preload("res://assets/scenes/levels/space pinball/space_pinball.tscn")
#tutorial:
const TUTORIAL_1 = preload("res://assets/scenes/levels/tutorial/tutorial_1.tscn")

#variables:

func _ready() -> void:
	var lvl_select = LEVEL_SELECT.instantiate()
	add_child(lvl_select)
	GlobalSignals.emit_signal("move", 653, 450)
	get_child(0).set_meta("disabled", true)
	

func room_called(selected_room: int) -> void:
	match selected_room:
		0:
			load_test()
		1:
			load_jg()
		2:
			load_medevial()
		3:
			pass
			
		4:
			pass
			
		5:
			load_strong()
		6:
			load_mid()
		7:
			load_tut()
		
	
func load_jg() -> void:
	GlobalSignals.emit_signal("move", -1605, 375)
	var lvl = JG_1.instantiate()
	add_child(lvl)
	await lvl.ready
	
	
func load_test() -> void:
	print("load test")
	var lvl = TEST_1.instantiate()
	add_child(lvl)
	#emit_signal("player_enabled")

func load_medevial() -> void:
	var lvl = PIZZASCAPE_1.instantiate()
	add_child(lvl)

func load_ruin() -> void:
	var lvl = ANCIENT_1.instantiate()
	add_child(lvl)

func load_dungeon() -> void:
	var lvl = BLOODSAUCE_1.instantiate()
	add_child(lvl)

func load_strong() -> void:
	GlobalSignals.emit_signal("move", 506, 320)
	var lvl = STRONGCOLD_1.instantiate()
	add_child(lvl)

func load_mid() -> void:
	var lvl = MIDESCAPE_1.instantiate()
	add_child(lvl)
	
func load_tut() -> void:
	GlobalSignals.emit_signal("move", -275, -329)
	var lvl = TUTORIAL_1.instantiate()
	add_child(lvl)

func load_room_test(id: int, prev_id: int) -> void:
	GlobalSignals.emit_signal("hide", prev_id)
	if check_if_loaded(id) == true:
		GlobalSignals.emit_signal("show", id)
	else:
		var lvl = level_test[id].instantiate()
		add_child(lvl)

## loads rooms from john gutter specifically, maybe it would make more sense if i made this a generic load room function but i dont really care
func load_room_jg(id: int, prev_id: int) -> void:
	GlobalSignals.emit_signal("hide", prev_id)
	if check_if_loaded(id) == true:
		GlobalSignals.emit_signal("show", id)
	else:
		var lvl = level_jg[id].instantiate()
		add_child(lvl)

func load_room_midevial(id: int, prev_id: int) -> void:
	GlobalSignals.emit_signal("hide", prev_id)
	if check_if_loaded(id) == true:
		GlobalSignals.emit_signal("show", id)
	else:
		var lvl = level_medevial[id].instantiate()
		add_child(lvl)

func load_room_ruin(id: int, prev_id: int) -> void:
	GlobalSignals.emit_signal("hide", prev_id)
	if check_if_loaded(id) == true:
		GlobalSignals.emit_signal("show", id)
	else:
		var lvl = level_ruin[id].instantiate()
		add_child(lvl)

func load_room_dungeon(id: int, prev_id: int) -> void:
	GlobalSignals.emit_signal("hide", prev_id)
	if check_if_loaded(id) == true:
		GlobalSignals.emit_signal("show", id)
	else:
		var lvl = level_dungeon[id].instantiate()
		add_child(lvl)

func load_room_strong(id: int, prev_id: int) -> void:
	GlobalSignals.emit_signal("hide", prev_id)
	if check_if_loaded(id) == true:
		GlobalSignals.emit_signal("show", id)
	else:
		var lvl = level_strong[id].instantiate()
		add_child(lvl)

func load_room_mid(id: int, prev_id: int) -> void:
	GlobalSignals.emit_signal("hide", prev_id)
	if check_if_loaded(id) == true:
		GlobalSignals.emit_signal("show", id)
	else:
		var lvl = level_mid[id].instantiate()
		add_child(lvl)

func load_room_tutorial(id: int, prev_id: int) -> void:
	GlobalSignals.emit_signal("hide", prev_id)
	if check_if_loaded(id) == true:
		GlobalSignals.emit_signal("show", id)
	else:
		var lvl = level_tutorial[id].instantiate()
		add_child(lvl)

func disable_player(x: bool) -> void:
	get_child(0).set_meta("disabled", x)

func check_if_loaded(id: int) -> bool:
	var thingy: bool = false
	for child in get_children():
		if child is room: #the player is a child of the parent so this is necessary unfortunately :middle_finger:
			if child.room_id == id:
				thingy = true
	return thingy

func clear_rooms() -> void:
	for child in get_children():
		if child is room:
			child.queue_free()

func _player_camera_limit(left: int, top: int, right: int, bottom: int) -> void:
	#print(left,top,right,bottom)
	player_limit_left.emit(left)
	player_limit_top.emit(top)
	player_limit_right.emit(right)
	player_limit_bottom.emit(bottom)
