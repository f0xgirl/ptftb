extends AnimatedSprite2D
#TODO: connect signals, probably have them in global signals or something idk maybe i can have them in here

signal anim_transition()


func _ready() -> void:
	anim_transition.connect(_transitioned_anim)

func _anim(anim: String):
	play(anim)

func _transitioned_anim(anim: String):
	play(anim)
