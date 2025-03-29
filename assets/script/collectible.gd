extends Area2D
class_name collectible

@export var worth: int

func _ready() -> void:
	get_parent().connect("hidden", _hidden)
	get_parent().connect("visible", _visible)


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		GlobalSignals.emit_signal("add_score", worth)
		print("adding")
		queue_free()

func _hidden() -> void:
	hide()
	set_deferred("monitoring", false)


func _visible() -> void:
	set_deferred("monitoring", true)
	show()
