extends room


func _on_tree_entered() -> void:
	Audioplayer._play_music_hub()
	get_parent().emit_signal("send_level_name", level_name)
