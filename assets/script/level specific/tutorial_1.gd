extends room


func _on_tree_entered() -> void:
	get_parent().emit_signal("send_level_name", level_name)
