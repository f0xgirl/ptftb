extends StaticBody2D

func _ready() -> void:
	if Jsonsaveloading.load_level_data("tutorial") == 200 and Jsonsaveloading.load_level_data("john gutter") == 1070:
		queue_free()
