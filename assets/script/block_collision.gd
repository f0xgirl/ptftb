extends Sprite2D
class_name basic_block

@export var res: block_data

func _ready() -> void:
	if res.destroyed == true:
		queue_free()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player") and DataPassthrough.player_state == "player_mach2" or DataPassthrough.player_state == "player_mach3":
		res.destroyed = true
		queue_free()
