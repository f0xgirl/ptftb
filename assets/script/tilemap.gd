extends TileMapLayer


func _hidden() -> void:
	enabled = false
	hide()


func _visible() -> void:
	enabled = true
	show()
