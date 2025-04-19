extends Area2D
class_name state_changer
@export var state: String

func _ready() -> void:
	get_parent().connect("hidden", _hidden)
	get_parent().connect("visible", _visible)

func _state_change(body: Node2D):
	print("hi")
	if body.is_in_group("player"):
		pass

func _hidden() -> void:
	pass

func _visible() -> void:
	pass
