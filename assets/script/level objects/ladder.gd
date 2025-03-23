extends Area2D

func _ready() -> void:
	pass
	#get_parent().connect("hidden", _hidden)
	#get_parent().connect("visible", _visible) do this later


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		pass


func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		pass
