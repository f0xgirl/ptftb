@icon("res://assets/sprites/levels/level visuals/spr_metalb_0.png")
extends block_base

class_name metal_block

@onready var sprite: Sprite2D = $Sprite2D


func _hidden() -> void:
	set_collision_layer_value(1, false)
	sprite.hide()


func _visible() -> void:
	set_collision_layer_value(1, true)
	sprite.show()
