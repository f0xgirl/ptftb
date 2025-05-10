@icon("res://assets/sprites/levels/level visuals/spr_metalb_0.png")
extends block_base

class_name metal_block

@onready var sprite: Sprite2D = $Sprite2D
@onready var broken: AudioStreamPlayer2D = %break

func _process(_delta: float) -> void:
	if is_queued_for_deletion() == true:
		broken.play()
		await broken.finished


func _hidden() -> void:
	set_collision_layer_value(1, false)
	sprite.hide()


func _visible() -> void:
	set_collision_layer_value(1, true)
	sprite.show()
