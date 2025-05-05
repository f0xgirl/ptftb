@icon("res://assets/sprites/spr_pizzacollect_0.png")
extends collectible
class_name big_collectible

@onready var sprite: Sprite2D = $sprite


func _hidden() -> void:
	hide()
	set_deferred("monitoring", false)

func _process(_delta: float) -> void:
	sprite.offset.y = 1
	await timer.timeout
	sprite.offset.y = -1
	await timer.timeout

func _visible() -> void:
	set_deferred("monitoring", true)
	show()

func _play_sfx_local() -> void:
	Audioplayer._play_sfx_toppinget_big()
