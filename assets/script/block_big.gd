extends block_base
class_name big_block

@onready var left_1: RayCast2D = $left1
@onready var left_2: RayCast2D = $left2
@onready var right_1: RayCast2D = $right1
@onready var right_2: RayCast2D = $right2
@onready var up: RayCast2D = $up
@onready var up_2: RayCast2D = $up2
@onready var down: RayCast2D = $down
@onready var down_2: RayCast2D = $down2



func _physics_process(_delta: float) -> void:
	_check_collision()


func _check_collision():
	if left_1.get_collider() == player and left_2.get_collider() == player:
		if DataPassthrough.player_state == "player_mach2" or DataPassthrough.player_state == "player_mach3":
			queue_free()
	elif right_1.get_collider() == player and right_2.get_collider() == player:
		if DataPassthrough.player_state == "player_mach2" or DataPassthrough.player_state == "player_mach3":
			queue_free()
