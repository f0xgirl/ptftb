extends StaticBody2D	

func _on_tree_entered() -> void:
	pass

func _process(delta: float) -> void:
	if Jsonsaveloading.load_level_data("tutorial") > 1:
		queue_free()