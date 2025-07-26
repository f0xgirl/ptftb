@icon("res://assets/sprites/levels/level visuals/roomchangevisual.png")
extends Area2D
class_name room_changer

enum room_call {
	test = 0,
	johngutter = 1,
	pizzascape = 2,
	ruin = 3,
	dungeon = 4,
	strongcold = 5,
	mid = 6,
	tutorial = 7,
	pinball = 8,
	hub1 = 9
}

@export_category("Locsation")
##id of current room
@export var room_id: int
@export var dunction_call: room_call
##id of room to change to
@export var next_room_id: int
@export_category("Player Postion")
@export var X: int
@export var Y: int

func _ready() -> void:
	get_parent().connect("hidden", _hidden)
	get_parent().connect("visible", _visible)


func _on_body_entered(body: Node2D) -> void:
	var room_goto: String
	match dunction_call:
		0:
			room_goto = "load_room_test"
		1:
			room_goto = "load_room_jg"
		2:
			room_goto = "load_room_midevial"
		3:
			room_goto = "load_room_ruin"
		4:
			room_goto = "load_room_dungeon"
		5:
			room_goto = "load_room_strong"
		6:
			room_goto = "load_room_mid"
		7:
			room_goto = "load_room_tutorial"
		8:
			room_goto = "load_room_pinball"
		9:
			room_goto = "load_room_hub1"

	Audioplayer._play_sfx_switchingrooms()
	Transition.transition()
	await Transition.on_transition_finished
	if body.is_in_group("player"):
		GlobalSignals.emit_signal("move", X, Y)
		get_parent().get_parent().call_deferred(room_goto, next_room_id, room_id)
		



func _hidden() -> void:
	hide()
	set_deferred("monitoring", false)


func _visible() -> void:
	set_deferred("monitoring", true)
	show()
