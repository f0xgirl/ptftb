extends Node
class_name room

signal visible
signal hidden

@export var room_name: StringName
@export var room_id: int

func _ready() -> void:
	GlobalSignals.connect("hide",hide_room)
	GlobalSignals.connect("show",show_room)
	GlobalSignals.connect("remove",remove)

func remove(selected_id: StringName):
	print("removed!")
	if selected_id == room_name:
		queue_free()

func hide_room(selected_id: int):
	print("hidden!")
	if selected_id == room_id:
		emit_signal("hidden")

func show_room(selected_id: int):
	print("shown!")
	if selected_id == room_id:
		pass
