extends Node

func _ready() -> void:
	if DataPassthrough.panic == false:
		Audioplayer._play_music_jg()
