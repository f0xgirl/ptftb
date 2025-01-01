extends Resource
class_name room_data
@export_group("camera boundaries")
@export var left: int
@export var top: int
@export var right: int
@export var bottom: int
@export_group("player pos")
@export var x: int
@export var y: int




func get_limit(index: int):
	var array = [left, top, right, bottom]
	return array[index]
