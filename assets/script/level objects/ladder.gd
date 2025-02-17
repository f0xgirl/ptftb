extends Area2D

@export var player: peppino



func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		player.disable_gravity(true)
		print(player.gravity)


func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		player.disable_gravity(false)
		print(player.gravity)
