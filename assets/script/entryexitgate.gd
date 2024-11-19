extends AnimatedSprite2D

@export var enterexit: bool

func _ready() -> void:
	if enterexit == true:
		play("open")
	else:
		play("closed")
