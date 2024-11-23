extends Area2D
@export_category("Location")
@export_dir var location
@export_category("Player Postion")
@export var X: int
@export var Y: int

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		get_tree().change_scene_to_file(location)
		DataPassthrough.keep_state = true
		DataPassthrough.player_pos_x = X
		DataPassthrough.player_pos_y = Y
