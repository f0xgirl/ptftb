@icon("res://assets/sprites/levels/level visuals/room.png")
extends Node
class_name room

signal visible
signal hidden
signal panic
signal send(id: int)
signal clear_score

@export_group("room data")
@export var room_name: StringName
@export var room_id: int
##only needs to be in first room
@export var level_name: String
@export_group("camera limits")
@export var left: int = -10000000
@export var top: int = -10000000
@export var right: int = 10000000
@export var bottom: int = 10000000

var already_loaded: bool = false

func _ready() -> void:
	GlobalSignals.connect("room_id_send", get_id)
	GlobalSignals.connect("hide",hide_room)
	GlobalSignals.connect("show",show_room)
	GlobalSignals.connect("remove",remove)
	get_parent().call("_player_camera_limit", left, top, right, bottom)
	#for child in get_children():
	#	child.hidden.connect(_hidden)

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

func get_id() -> void:
	emit_signal("send", room_id)
