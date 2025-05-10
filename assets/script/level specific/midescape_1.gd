extends room


func _on_tree_entered() -> void:
	get_parent().emit_signal("send_level_name" , level_name)
	Audioplayer._play_music_vir(1000)
	DataPassthrough.panic = true
	Globaltimer.start(1000)
