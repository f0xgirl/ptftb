extends State_player
class_name Player_roll

@export var sprite: AnimatedSprite2D 
@export var player: CharacterBody2D
@export var collision: CollisionShape2D
const PLAYER_CROUCHING = preload("res://resources/player/player_crouching.tres")
@onready var crouch_raycast_1: RayCast2D = $"../../crouch raycast1"
@onready var crouch_raycast_2: RayCast2D = $"../../crouch raycast2"


func Enter():
	collision.shape = PLAYER_CROUCHING
	sprite.play("crouchslip")
	DataPassthrough.player_state = "player_roll"
	
func Pyhsics_Update(_delta: float):
	print(player.velocity.x)
	player.velocity.x = move_toward(player.velocity.x, 0, 10)
	if player.velocity.x == 0:
		if above_head_empty():
			Transitioned.emit(self,"player_idle")
		else:
			Transitioned.emit(self,"player_idle_crouched")

func above_head_empty() -> bool:
	var result = !crouch_raycast_1.is_colliding() && !crouch_raycast_2.is_colliding()
	return result
