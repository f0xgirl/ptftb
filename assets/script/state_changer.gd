extends Area2D

@export var player: peppino
@export var state: String



func _on_body_entered(body: Node2D) -> void:
	print("hi")
	if body.is_in_group("player"):
		player.state_override = true
		player.state_override_change = state
