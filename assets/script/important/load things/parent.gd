extends Node

#signals
signal remove
signal wait_hub_loaded
signal send_level_name(name: String)
signal kill_pizzaface
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
@export var level_pinball: Array [PackedScene] = []
@export var hub_1: Array [PackedScene] = []
#constants:
const PIZZAFACE = preload("res://assets/scenes/level objects/pizzaface.tscn")
# variables
var level_exitinfo: level_info

#can be switched out for the hubs when i get to that
const LEVEL_SELECT = preload("res://assets/scenes/level_select.tscn")
#room shown when caught by pizza face
const CAUGHT = preload("res://assets/scenes/caught.tscn")
#hub1:
const HUB_1 = preload("res://assets/scenes/levels/hubs/hub1_1.tscn")
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
const SPACE_PINBALL = preload("res://assets/scenes/levels/space pinball/space_pinball_1.tscn")
#tutorial:
const TUTORIAL_1 = preload("res://assets/scenes/levels/tutorial/tutorial_1.tscn")
#pinball:


#variables:
var score: int
@onready var errorhandler: Node = %errorhandler

func _ready() -> void:
	GlobalSignals.connect("timesup",pizzaface_spawn)
	kill_pizzaface.connect(pizzaface_despawn)
	#var lvl_select = HUB_1.instantiate()
	#add_child(lvl_select)
	load_hub1(-578, 465, 0)
	#GlobalSignals.emit_signal("move", 145, 228) #145 228: hub1 | 653 450 levelselect
	#get_child(0).set_meta("disabled", true)

func save_score(change: int) -> void:
	score = change


func room_called(selected_room: int) -> void:
	match selected_room:
		0:
			load_test()
		1:
			load_jg()
		2:
			load_medevial()
		3:
			load_ruin()
			
		4:
			load_dungeon()
			
		5:
			load_strong()
		6:
			load_mid()
		7:
			load_tut()
		8:
			load_pinball()
		9:
			load_levelselect()
		
		
	
func load_caught() -> void:
	GlobalSignals.emit_signal("change_state", "player_walkfront", NAN)
	GlobalSignals.emit_signal("move", 0, 0)
	var lvl = CAUGHT.instantiate()
	add_child(lvl)
	await lvl.ready

func load_jg() -> void:
	GlobalSignals.emit_signal("change_state", "player_walkfront", NAN)
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
	GlobalSignals.emit_signal("change_state", "player_walkfront", 0)
	GlobalSignals.emit_signal("move", 506, 320)
	var lvl = STRONGCOLD_1.instantiate()
	add_child(lvl)

func load_mid() -> void:
	var lvl = MIDESCAPE_1.instantiate()
	add_child(lvl)
	await  lvl.ready
	GlobalSignals.emit_signal("move", 762, -208)

func load_tut() -> void:
	GlobalSignals.emit_signal("change_state", "player_walkfront", NAN)
	GlobalSignals.emit_signal("move", -275, -329)
	var lvl = TUTORIAL_1.instantiate()
	add_child(lvl)

func load_pinball() -> void:
	GlobalSignals.emit_signal("move", 385, 110) #temp
	var lvl = SPACE_PINBALL.instantiate()
	add_child(lvl)

# this is a little different from the rest,
# because you might have to go to different rooms when you complete a level
func load_hub1(X: int, Y: int, id: int) -> void:
	GlobalSignals.emit_signal("move", X, Y)
	var lvl = hub_1[id].instantiate()
	add_child(lvl)

func load_levelselect() -> void:
	var lvl = LEVEL_SELECT.instantiate()
	add_child(lvl)
	await lvl.ready
	GlobalSignals.emit_signal("move", 653, 450)

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

func load_room_pinball(id: int, prev_id: int) -> void:
	GlobalSignals.emit_signal("hide", prev_id)
	if check_if_loaded(id) == true:
		GlobalSignals.emit_signal("show", id)
	else:
		var lvl = level_pinball[id].instantiate()
		add_child(lvl)
		

func load_room_hub1(id: int, prev_id: int) -> void:
	GlobalSignals.emit_signal("hide", prev_id)
	if check_if_loaded(id) == true:
		GlobalSignals.emit_signal("show", id)
	else:
		var lvl = hub_1[id].instantiate()
		add_child(lvl)



func disable_player() -> void:
	get_child(0).set_meta("disabled", true)

func enable_player() -> void:
	get_child(0).set_meta("disabled", false)

func check_if_loaded(id: int) -> bool:
	var thingy: bool = false
	for child in get_children():
		if child is room: #the player is a child of the parent so this is necessary unfortunately :middle_finger:
			if child.room_id == id:
				thingy = true
	return thingy

func clear_rooms() -> void:
	GlobalSignals.emit_signal("send_score", score)
	for child in get_children():
		if child is room:
			child.queue_free()

func _player_camera_limit(left: int, top: int, right: int, bottom: int) -> void:
	player_limit_left.emit(left)
	player_limit_top.emit(top)
	player_limit_right.emit(right)
	player_limit_bottom.emit(bottom)

func pizzaface_spawn() -> void:
	var pizza = PIZZAFACE.instantiate()
	add_child(pizza)

func pizzaface_despawn() -> void:
	for child in get_children():
		if child.name.begins_with("pizzaface"):
			child.queue_free()
	
