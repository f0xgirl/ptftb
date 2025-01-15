extends Sprite2D

#true; will become uncollidable when pizza time
@export var panic_active: bool

func _process(delta: float) -> void:
	if DataPassthrough.panic == true and panic_active == true:
		queue_free()
	elif DataPassthrough.panic == false and panic_active == false:
		queue_free()
