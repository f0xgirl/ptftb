@icon("res://assets/sprites/spr_bigbreakable_0.png")
extends block_base
class_name block_big_collectible

func _process(delta: float) -> void:
	if is_queued_for_deletion():
		GlobalSignals.emit_signal("add_score", 100)
