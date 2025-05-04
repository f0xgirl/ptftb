extends state_changer
class_name speed_pad
##1 is right -1 is left
@export_range(-1, 1) var direction: int
signal changedir(dir: int)

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		GlobalSignals.emit_signal("change_state", state, direction)

func _hidden() -> void:
	set_collision_mask_value(2, false)

func _visible() -> void: 
	set_collision_mask_value(2, true)
