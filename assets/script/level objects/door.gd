extends Area2D

@export_category("Location")
##id of current room
@export var room_id: int
##put method name in parent script to load said room
@export var load_room: String
##id of room to change to
@export var next_room_id: int
@export_category("Player Postion")
@export var X: int
@export var Y: int
var enter: bool = false

func _ready() -> void:
	get_parent().connect("hidden", _hidden)
	get_parent().connect("visible", _visible)

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("up") and enter == true:
		Audioplayer._play_sfx_switchingrooms()
		GlobalSignals.emit_signal("move", X, Y)
		get_parent().get_parent().call(load_room, next_room_id, room_id)
		

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		enter = true
		print("true")

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		enter = false
		print("false")

func _hidden() -> void:
	hide()
	set_deferred("monitoring", false)
	set_process(false) #idk if this'll work but whatevs ill figure it out later


func _visible() -> void:
	set_process(true)
	set_deferred("monitoring", true)
	show()
