extends room





func _on_tree_entered() -> void:
	GlobalSignals.emit_signal("move",323, 690)
	
