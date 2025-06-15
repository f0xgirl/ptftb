@icon("res://assets/sprites/spr_destroyable_0.png")
extends block_base
class_name block_small

@onready var sprite: Sprite2D = $Sprite2D


func _ready() -> void:
	get_parent().get_parent().connect("hidden", _hidden)
	get_parent().get_parent().connect("visible", _visible)

func _process(_delta: float) -> void:
	if is_queued_for_deletion():
		var break_sfx = randi_range(1, 2)
		match break_sfx:
			1:
				Audioplayer._play_sfx_breaksmall()
			2:
				Audioplayer._play_sfx_breakbig()

func _hidden() -> void:
	set_collision_layer_value(1, false)
	sprite.hide()


func _visible() -> void:
	set_collision_layer_value(1, true)
	sprite.show()
