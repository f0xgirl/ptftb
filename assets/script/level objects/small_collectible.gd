@icon("res://assets/sprites/spr_tomatocollect_0.png")
extends collectible
class_name small_collectible

const TOMATOCOLLECT = preload("res://assets/sprites/spr_tomatocollect_0.png")
const PINEAPPLECOLLECT = preload("res://assets/sprites/spr_pineapplecollect_0.png")
const CHEESECOLLECT = preload("res://assets/sprites/spr_cheesecollect_0.png")
const SAUSAGECOLLECT = preload("res://assets/sprites/spr_sausagecollect_0.png")
const SHROOMCOLLECT = preload("res://assets/sprites/spr_shroomcollect_0.png")

@onready var sprite: Sprite2D = $sprite


func _process(delta: float) -> void:
	sprite.offset.y = 1
	await timer.timeout
	print("i work")
	sprite.offset.y = -1
	await timer.timeout

func randselect() -> void:
	var randomtopping = randi_range(1, 5)
	match randomtopping:
		1:
			sprite.texture = TOMATOCOLLECT
		2:
			sprite.texture = PINEAPPLECOLLECT
		3:
			sprite.texture = CHEESECOLLECT
		4:
			sprite.texture = SAUSAGECOLLECT
		5:
			sprite.texture = SHROOMCOLLECT

func _hidden() -> void:
	hide()
	set_deferred("monitoring", false)


func _visible() -> void:
	set_deferred("monitoring", true)
	show()
