extends room

@export var levels: Array [level_rank_req]
const LEVEL_SELECT = preload("res://assets/scenes/level_select.tscn")

signal rank_anim_finished


func _ready() -> void:
	var lvl = LEVEL_SELECT.instantiate()
	
	await rank_anim_finished
	
