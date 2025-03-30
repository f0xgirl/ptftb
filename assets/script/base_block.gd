extends StaticBody2D
class_name block_base

var player 

func _ready() -> void:
	player = get_parent().get_parent().find_child("player")
	get_parent().connect("hidden", _hidden)
	get_parent().connect("visible", _visible)


func _hidden() -> void:
	set_collision_layer_value(1, false)
	hide()


func _visible() -> void:
	set_collision_layer_value(1, true)
	show()
