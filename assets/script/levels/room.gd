extends Node
class_name level
@export var level_info: room_data
@export var level_name: String
@export var rooms: Array[PackedScene]

func _ready() -> void:
	var room1 = rooms[0].instantiate()
	add_child(room1)


func _on_tree_entered() -> void:
	DataPassthrough.player_pos_x = level_info.x
	DataPassthrough.player_pos_y = level_info.y
	print(DataPassthrough.player_pos_x)
	print(DataPassthrough.player_pos_y)
	print("hi")


func _on_tree_exited() -> void:
	pass # Replace with function body.
