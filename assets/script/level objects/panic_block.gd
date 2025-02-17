extends Sprite2D

#true; will become uncollidable when pizza time
@export var panic_active: bool
@onready var staticbod: StaticBody2D = $StaticBody2D


func _process(delta: float) -> void:
	if DataPassthrough.panic == true and panic_active == true:
		disable()
	elif DataPassthrough.panic == false and panic_active == false:
		disable()

func disable():
	staticbod.set_collision_layer_value(1, false)
	hide()
