extends Node
class_name room

@export var room_id: int

func _ready() -> void:
	pass


func _on_tree_entered() -> void:
	print("hi")
	Globalsignal.player_changepos.emit()
