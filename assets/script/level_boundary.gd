extends Area2D

@export var x: int
@export var y: int

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.global_position.x = x
		body.global_position.y = y
