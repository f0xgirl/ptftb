extends Resource
class_name level_data

@export var cam_limit: Array = [1,2,3,4]

func get_limit(index: int):
	return cam_limit[index]

func change_limit(change: int, index: int):
	cam_limit[index] = change 
