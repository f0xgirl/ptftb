extends state_changer

@onready var sprite: Sprite2D = $SprTomatocollect0


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		GlobalSignals.emit_signal("change_state", state, NAN)

func _hidden():
	set_collision_mask_value(2, false)
	sprite.hide()

func _visible():
	set_collision_mask_value(2, true)
	sprite.show()
