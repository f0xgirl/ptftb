extends room	

func _on_tree_entered() -> void:
	if DataPassthrough.panic == false:
		Audioplayer._play_music_pinball()
