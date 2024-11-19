extends Resource

class_name Enemy_Resource



@export var alive: bool


func killed():
	alive = false
	
func is_killed():
	return alive
