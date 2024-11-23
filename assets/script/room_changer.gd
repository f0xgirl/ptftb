extends Area2D
@export_dir var location


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		get_tree().change_scene_to_file(location)
		DataPassthrough.keep_state = true
