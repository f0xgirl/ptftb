extends Node

func _ready() -> void:
	Audioplayer._play_music_vir()
	DataPassthrough.panic = true
	Globaltimer.start(1000)
