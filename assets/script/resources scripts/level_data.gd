extends Resource
class_name level_data

@export_group("level stuff")
@export var level_name: String
@export var score: int = 0
@export_group("camera boundaries")
@export var left: int
@export var top: int
@export var right: int
@export var bottom: int




func get_limit(index: int):
	var array = [left, top, right, bottom]
	return array[index]
