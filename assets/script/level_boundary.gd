extends Area2D

@export var x: int
@export var y: int

func _ready() -> void:
	get_parent().connect("hidden", _hidden)
	get_parent().connect("visible", _visible)


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.global_position.x = x
		body.global_position.y = y

func _hidden() -> void:
	set_deferred("monitoring", false)

func _visible() -> void:
	set_deferred("monitoring", true)
