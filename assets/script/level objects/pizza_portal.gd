extends Area2D

@onready var lap_enter: AudioStreamPlayer2D = $lap_enter
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

@export_category("Location")
##id of current room
@export var room_id: int
##put method name in parent script to load said room
@export var function_call: String
##id of room to change to
@export var next_room_id: int
@export_category("Player Postion")
@export var X: int
@export var Y: int

func _ready() -> void:
	get_parent().connect("hidden", _hidden)
	get_parent().connect("visible", _visible)

func _on_body_entered(body: Node2D) -> void:
	lap_enter.play()
	Transition.transition()
	await Transition.on_transition_finished
	if body.is_in_group("player"):
		GlobalSignals.emit_signal("move", X, Y)
		get_parent().get_parent().call_deferred(function_call, next_room_id, room_id)

func _hidden() -> void:
	hide()
	set_deferred("monitoring", false)

func _visible() -> void:
	set_deferred("monitoring", true)
	show()
