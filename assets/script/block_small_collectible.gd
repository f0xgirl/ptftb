@icon("res://assets/sprites/spr_destroyable2_0.png")
extends block_base



func _process(delta: float) -> void:
	if is_queued_for_deletion():
		GlobalSignals.emit_signal("add_score", 10)
