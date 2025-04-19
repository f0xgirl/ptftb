extends state_changer
class_name olive_grav


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		GlobalSignals.emit_signal("change_state", state, NAN)

func _hidden() -> void:
	set_collision_mask_value(2, false)

func _visible() -> void: 
	set_collision_mask_value(2, true)
