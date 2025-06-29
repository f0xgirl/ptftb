extends StaticBody2D	

func _on_tree_entered() -> void:
	await Jsonsaveloading.ready
	if Jsonsaveloading.check_if_tutorial_completed() == true:
		queue_free()
