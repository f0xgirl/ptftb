extends Node

@export var player_data: player_data

func _ready() -> void:
	player_data.change_limit(390, 3)
	player_data.change_limit(-1000, 0)
