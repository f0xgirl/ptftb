extends Sprite2D

@export var plr: peppino

func _process(delta: float) -> void:
	global_position = Vector2(plr.position.x - 50 * plr.player_data.player_direction, plr.position.y)
