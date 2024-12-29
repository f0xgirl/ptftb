extends Sprite2D
class_name metal_block

func _ready() -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player") and DataPassthrough.player_state == "player_mach3":
		queue_free()
