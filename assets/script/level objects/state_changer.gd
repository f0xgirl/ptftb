extends Area2D
class_name state_changer
@export var player: peppino
@export var state: String


func _state_change(body: Node2D):
	print("hi")
	if body.is_in_group("player"):
		player.state_override = true
		player.state_override_change = state
