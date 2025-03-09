extends room



func _tree_entered() -> void:
	Audioplayer._play_music_jg()
	GlobalSignals.emit_signal("move", -1605, 269)
