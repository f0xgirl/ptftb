extends room


func _ready() -> void:
	Audioplayer._play_music_hub()
	emit_signal("ready")
