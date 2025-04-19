extends Area2D
class_name collectible

@onready var timer: Timer = $Timer
@onready var sprite: Sprite2D = $sprite
@export var worth: int

func _ready() -> void:
	timer.start()
	get_parent().connect("hidden", _hidden)
	get_parent().connect("visible", _visible)


func _on_area_2d_body_entered(body: Node2D) -> void:
	
	if body.is_in_group("player"):
		GlobalSignals.emit_signal("add_score", worth)
		Audioplayer._play_sfx_toppinget_small()
		queue_free()

func _hidden() -> void:
	hide()
	set_deferred("monitoring", false)

func _process(delta: float) -> void:
	sprite.offset.y = 1
	await timer.timeout
	sprite.offset.y = -1
	await timer.timeout

func _visible() -> void:
	set_deferred("monitoring", true)
	show()
