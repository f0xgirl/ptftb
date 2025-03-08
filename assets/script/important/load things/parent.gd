extends Node
class_name parent

signal disable_player
signal enable_player

const PLAYER = preload("res://assets/scenes/player.tscn")
## can be switched out for the hubs when i get to that
const LEVEL_SELECT = preload("res://assets/scenes/level_select.tscn")

func _ready() -> void:
	var plr = PLAYER.instantiate()
	var lvl_select = LEVEL_SELECT.instantiate()
	add_child(plr)
	add_child(lvl_select)
	emit_signal("disable_player")
