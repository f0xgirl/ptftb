extends TileMapLayer

func _ready() -> void:
	get_parent().connect("hidden", _hidden)
	get_parent().connect("visible", _visible)

func _hidden() -> void:
	enabled = false
	hide()


func _visible() -> void:
	enabled = true
	show()
