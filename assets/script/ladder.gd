extends Area2D

@export var player: peppino



func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		player.in_ladder_or_not(true)
		print(player.in_ladder)


func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		player.in_ladder_or_not(false)
		print(player.in_ladder)
