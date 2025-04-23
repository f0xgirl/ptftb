extends room



func _tree_entered() -> void:
	get_parent().emit_signal("send_level_name" , level_name)
	Audioplayer._play_music_jg()
	
