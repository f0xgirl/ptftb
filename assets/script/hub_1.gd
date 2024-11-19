extends Node

@export var level_data: level_data

func _ready() -> void:
	
	level_data.change_limit(336, 3)
	
