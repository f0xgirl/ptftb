extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player") and DataPassthrough.player_state == "player_mach2" or DataPassthrough.player_state == "player_mach3":
		DataPassthrough.panic = true
		queue_free()
		Audioplayer._play_music_placeholder()
