extends state_changer
class_name speed_pad
## 1 is left
@export_range(-1, 1) var direction: int
signal changedir(dir: int)

func _on_body_entered(body: Node2D) -> void:
	_state_change(player)
	emit_signal("changedir", direction)
