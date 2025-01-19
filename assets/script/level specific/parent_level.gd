extends Node

const TEST = preload("res://assets/scenes/levels/testing/testing.tscn")
const PLR = preload("res://assets/scenes/player.tscn")
var levels: Array [PackedScene]
func _ready() -> void:
	
	Globalsignal.changelevel.connect(change_loaded_levels)
	Globalsignal.changeroom.connect(roomchange)
	var player = PLR.instantiate()
	
	add_child(player)
	
func roomchange(index: int):
	var unpacked = levels[index].instantiate()
	add_child(unpacked)

func change_loaded_levels(new_levels: Array [PackedScene]):
	levels = new_levels
