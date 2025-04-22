extends Area2D
class_name collectible

@export var worth: int
@onready var timer: Timer = $Timer

func _ready() -> void:
	timer.start()
	randselect()
	get_parent().connect("hidden", _hidden)
	get_parent().connect("visible", _visible)


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		GlobalSignals.emit_signal("add_score", worth)
		Audioplayer._play_sfx_toppinget_small()
		queue_free()

func _hidden() -> void:
	pass


func _visible() -> void:
	pass

func randselect() -> void:
	pass
