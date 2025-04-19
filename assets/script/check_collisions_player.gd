extends Area2D

signal is_block
signal block_gone


func _process(delta: float) -> void:
	if has_overlapping_bodies():
		emit_signal("is_block")
	else:
		emit_signal("block_gone")
