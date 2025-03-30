@icon("res://assets/sprites/levels/level visuals/spr_metalb_0.png")
extends block_base

class_name metal_block

@onready var sprite: Sprite2D = $Sprite2D
@onready var left1: RayCast2D = $left1
@onready var left2: RayCast2D = $"left2"
@onready var right1: RayCast2D = $right1
@onready var right2: RayCast2D = $right2
@onready var down: RayCast2D = $down
@onready var up: RayCast2D = $up



func _physics_process(delta: float) -> void:
	_check_collision()

func _check_collision():
	if left1.get_collider() == player or left2.get_collider() == player:
		if DataPassthrough.player_state == "player_mach3":
			queue_free()
	elif right1.get_collider() == player or right2.get_collider() == player:
		if DataPassthrough.player_state == "player_mach3":
			queue_free()

func _hidden() -> void:
	set_collision_layer_value(1, false)
	hide()


func _visible() -> void:
	set_collision_layer_value(1, true)
	show()
