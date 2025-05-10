@icon("res://assets/sprites/smallveggie.png")
extends block_base

@onready var near: AudioStreamPlayer2D = $near
@export var panic_time: float = 1000



func _process(_delta: float) -> void:
	if is_queued_for_deletion():
		Transition.whiteout()
		print("works")
		DataPassthrough.panic = true
		Audioplayer._play_music_pizzatime()
		Audioplayer._play_sfx_pillar_impact()
		get_parent().get_parent().emit_signal("panic")
		Globaltimer.start(panic_time)
	#TODO: add some logic to quiet the music when the player is near john

func _hidden():
	near.stop()
	set_collision_layer_value(1, false)
	hide()

func _visible():
	near.play()
	set_collision_layer_value(1, true)
	show()
