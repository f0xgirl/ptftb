extends Node2D

@export var alive : Enemy_Resource


func _process(delta: float) -> void:
	if alive.is_killed() == false:
		queue_free()
	
