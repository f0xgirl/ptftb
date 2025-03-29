extends Area2D
class_name state_changer
@export var state: String


func _state_change(body: Node2D):
	print("hi")
	if body.is_in_group("player"):
		pass
