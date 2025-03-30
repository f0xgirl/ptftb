extends block_base
class_name block_small

@onready var left: RayCast2D = $left
@onready var right: RayCast2D = $right
@onready var up: RayCast2D = $up
@onready var down: RayCast2D = $down



func _physics_process(delta: float) -> void:
	_check_collision()



func _check_collision():
	if left.get_collider() == player:
		if DataPassthrough.player_state == "player_mach2" or DataPassthrough.player_state == "player_mach3":
			queue_free()
	elif right.get_collider() == player:
		if DataPassthrough.player_state == "player_mach2" or DataPassthrough.player_state == "player_mach3":
			queue_free()
