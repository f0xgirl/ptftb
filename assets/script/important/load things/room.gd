@icon("res://assets/sprites/levels/level visuals/room.png")
extends Node
class_name room

signal visible
signal hidden
signal panic
signal send(id: int)

@export_group("room data")
@export var room_name: StringName
@export var room_id: int
@export_group("camera limits")
@export var left: int
@export var top: int
@export var right: int
@export var bottom: int

var already_loaded: bool = false

func _ready() -> void:
	GlobalSignals.connect("room_id_send", get_id)
	GlobalSignals.connect("hide",hide_room)
	GlobalSignals.connect("show",show_room)
	GlobalSignals.connect("remove",remove)
	get_parent().call("_player_camera_limit", left, top, right, bottom)

func remove(selected_id: StringName) -> void:
	print("removed!")
	if selected_id == room_name:
		queue_free()

func hide_room(selected_id: int) -> void:
	#print("hidden!")
	if selected_id == room_id:
		emit_signal("hidden")

func show_room(selected_id: int) -> void:
	print("shown!")
	if selected_id == room_id:
		get_parent().call("_player_camera_limit", left, top, right, bottom)
		emit_signal("visible")


func _tree_entered() -> void:
	print("what the?")

func get_id() -> void:
	emit_signal("send", room_id)
