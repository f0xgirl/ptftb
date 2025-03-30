extends AnimatedSprite2D

const LEVEL_SELECT = preload("res://assets/scenes/level_select.tscn")

@export var enterexit: bool
@export_category("Player Postion")
@export var X: int
@export var Y: int
var enter = false

func _ready() -> void:
	get_parent().connect("hidden", _hidden)
	get_parent().connect("visible", _visible)
	if enterexit == true or DataPassthrough.panic == true:
		play("open")
	else:
		play("closed")
	if DataPassthrough.panic == true:
		enterexit = true

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("up") and enter == true and DataPassthrough.panic == true:
		var lvl_select = LEVEL_SELECT.instantiate()
		get_parent().get_parent().call("clear_rooms")
		get_parent().get_parent().emit_signal("player_clear_score")
		get_parent().get_parent().add_child(lvl_select) #adds level select to parent
		get_parent().get_parent().call("disable_player", true) #disables player from moving
		Globaltimer.stop()
		await lvl_select.ready #for some reason this makes it so the player doesnt end up in the middle of nowhere
		GlobalSignals.emit_signal("move", -1605, 269)
		DataPassthrough.panic = false
		


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		enter = true	

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		enter = false

func _hidden() -> void:
	hide()
	set_deferred("monitoring", false)


func _visible() -> void:
	set_deferred("monitoring", true)
	show()
