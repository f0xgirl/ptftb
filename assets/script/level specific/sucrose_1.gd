extends Node

func _ready() -> void:
	DataPassthrough.panic = true
	Globaltimer.start(1000)
	Audioplayer._play_music_sugar()
