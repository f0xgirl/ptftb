@icon("res://assets/sprites/spr_exitgate_0.png")
extends Sprite2D
class_name gate_portal

const LEVEL_SELECT = preload("res://assets/scenes/level_select.tscn")
const HUB_1 = preload("res://assets/scenes/levels/hubs/hub1_1.tscn")

@onready var animation_tree: AnimationTree = $AnimationTree
@onready var score_text: Label = $score

enum levels {
	TEST = 0,
	JOHNGUTTER = 1,
	PIZZASCAPE = 2,
	RUIN = 3,
	DUNGEON = 4,
	STRONGCOLD = 5,
	MID = 6,
	TUTORIAL = 7,
	PINBALL = 8,
	LEVELSELECT = 9

}
enum hubs {
	LEVELSELECT = 0,
	HUB1 = 1,
	HUB2 = 2,
	HUB3 = 3,
	HUB4 = 4,
	HUB5 = 5
}

@export_category("hub")
@export var enterexit: bool
@export var level_name: String
@export var level: levels
@export var selected_hub: hubs
@export_category("Player Exit Position")
##ignore if "level_select" is selected, as the node doesnt read the data from this variable
@export var leaving: room_data

var score: int
var enter = false
var hub_is_loaded: bool = false

func _ready() -> void:
	get_parent().get_parent().call("set_player_hub_destination", selected_hub)
	get_parent().get_parent().call("set_player_exit_data", leaving)
	get_parent().connect("hidden", _hidden)
	get_parent().connect("visible", _visible)
	get_parent().get_parent().connect("wait_hub_loaded", _is_loaded)
	GlobalSignals.connect("send_score", _get_score) 
	score_text.text = "score:\n " + var_to_str(Jsonsaveloading.load_level_data(level_name))
	if enterexit == false:
		score_text.hide()

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("up") and enter == true and DataPassthrough.panic == true:
		get_parent().get_parent().find_child("player").call("save_data")
		get_parent().get_parent().call("clear_rooms")
		get_parent().get_parent().emit_signal("player_clear_score")
		DataPassthrough.panic = false
		match selected_hub:
			0:
				get_parent().get_parent().call("load_levelselect")
			1:
				get_parent().get_parent().call("load_hub1", leaving.X, leaving.Y, leaving.room_id)
			2:
				pass
			3:
				pass
			4:
				pass
			5:
				pass
			
		get_parent().get_parent().emit_signal("kill_pizzaface")
		#get_parent().get_parent().add_child(lvl_select) #adds level select to parent
		#get_parent().get_parent().call("disable_player", true) #disables player from moving
		Globaltimer.stop()
		
		#await lvl_select.ready #for some reason this makes it so the player doesnt end up in the middle of nowhere\
		#GlobalSignals.emit_signal("move", X, Y)
	
	
	if Input.is_action_just_pressed("up") and enter == true and enterexit == true:
		get_parent().get_parent().call("clear_rooms")
		get_parent().get_parent().call("room_called", level)
		#get_parent().queue_free()
	if DataPassthrough.panic == true or enterexit == true:
		animation_tree.set("parameters/blend_position", 1)
	else:
		animation_tree.set("parameters/blend_position", -1)


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		enter = true	
	if enterexit == true:
		score_text.show()
		

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		enter = false
	if enterexit == true:
		score_text.hide()

func _hidden() -> void:
	hide()
	set_deferred("monitoring", false)


func _visible() -> void:
	set_deferred("monitoring", true)
	show()

func _is_loaded() -> void:
	hub_is_loaded = true

func _get_score(send: int) -> void:
	score = send

func _set_score_test(score): 
	score_text = score
