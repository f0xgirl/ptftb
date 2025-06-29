extends room


func _on_tree_entered() -> void:
	get_parent().emit_signal("send_level_name", level_name)


func _on_tree_exited() -> void:
	Jsonsaveloading.tutorial_complete()
