@icon("res://assets/sprites/sprite387_0.png")
extends block_base
class_name block_big

@onready var sprite: Sprite2D = $Sprite2D

func _ready() -> void:
	get_parent().get_parent().connect("hidden", _hidden)
	get_parent().get_parent().connect("visible", _visible)

func _hidden() -> void:
	set_collision_layer_value(1, false)
	sprite.hide()


func _visible() -> void:
	set_collision_layer_value(1, true)
	sprite.show()

func _process(delta: float) -> void:
	if is_queued_for_deletion():
		var break_sfx = randi_range(1, 2)
		match break_sfx:
			1:
				Audioplayer._play_sfx_breaksmall()
			#this specific line has a mysterious space and i dont know why
			2:
				Audioplayer._play_sfx_breakbig()