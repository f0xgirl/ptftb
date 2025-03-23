extends Area2D
class_name metal_block

func _ready() -> void:
	get_parent().connect("hidden", _hidden)
	get_parent().connect("visible", _visible)


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player") and DataPassthrough.player_state == "player_mach3":
		queue_free()

func _hidden() -> void:
	hide()
	set_deferred("monitoring", false)

func _visible() -> void:
	show()
	set_deferred("monitoring", true)


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player") and DataPassthrough.player_state == "player_mach3":
		queue_free()
