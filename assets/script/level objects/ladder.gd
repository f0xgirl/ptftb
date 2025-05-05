@icon("res://assets/sprites/spr_ladder_0.png")
extends Area2D

var entered: bool = false
var plr: peppino
@onready var sprite: Sprite2D = $SprLadder0
@onready var collision: CollisionShape2D = $CollisionShape2D
signal check_if_outside

func _ready() -> void:
	get_parent().connect("hidden", _hidden)
	get_parent().connect("visible", _visible)
	connect("check_if_outside" , checking_if_outside)


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		plr = body
		print("enter " + var_to_str(name))
		entered = true

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("up") and entered == true:
		GlobalSignals.emit_signal("move", position.x, plr.position.y )
		GlobalSignals.emit_signal("change_state","player_on_ladder", NAN)
		print(var_to_str(entered) + " " + var_to_str(name))
	elif Input.is_action_just_pressed("down") and entered == true:
		GlobalSignals.emit_signal("move", position.x, plr.position.y )
		GlobalSignals.emit_signal("change_state","player_on_ladder", NAN)
		print(var_to_str(entered) + " " + var_to_str(name))
	if entered == false and DataPassthrough.player_state == "player_on_ladder":
		for index in get_overlapping_bodies():
			if index == plr:
				GlobalSignals.emit_signal("change_state", "player_idle", NAN)
		

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		print("exit " + var_to_str(name))
		entered = false
		emit_signal("check_if_outside")

func _hidden():
	sprite.hide()
	collision.set_deferred("disabled", true)
	set_collision_mask_value(3, false)

func _visible():
	sprite.show()
	collision.set_deferred("disabled", false)
	set_collision_mask_value(3, true)

func checking_if_outside() -> void:
	if entered == false and DataPassthrough.player_state == "player_on_ladder":
		GlobalSignals.emit_signal("change_state", "player_idle", NAN)
