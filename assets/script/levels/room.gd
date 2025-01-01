extends Node
class_name level
@export var level_data: room_data
@export var room_info: Array [room_info]

func _ready() -> void:
	DataPassthrough.player_pos_x = level_data.x
	DataPassthrough.player_pos_y = level_data.y
	
