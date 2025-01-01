extends Node
class_name level
@export var level_data: room_data
@export var rooms: Array[PackedScene]

func _ready() -> void:
	pass
	


func _on_tree_entered() -> void:
	DataPassthrough.player_pos_x = level_data.x
	DataPassthrough.player_pos_y = level_data.y
	print("hi")


func _on_tree_exited() -> void:
	pass # Replace with function body.
