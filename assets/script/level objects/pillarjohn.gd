extends StaticBody2D

@export var panic_time: float = 1000

func _process(delta: float) -> void:
	if is_queued_for_deletion():
		print("works")
		DataPassthrough.panic = true
		Audioplayer._play_music_pizzatime()
		Audioplayer._play_sfx_pillar_impact()
		get_parent().emit_signal("panic")
		Globaltimer.start(panic_time)
