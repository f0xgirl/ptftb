extends room


func _on_tree_entered() -> void:
	Audioplayer._play_music_vir()
	DataPassthrough.panic = true
	Globaltimer.start(1000)
