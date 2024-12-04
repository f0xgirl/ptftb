extends Area2D
class_name basic_block

@onready var block: Sprite2D = $".."



func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player") and DataPassthrough.player_state == "player_mach2" or DataPassthrough.player_state == "player_mach3":
		block.queue_free()
