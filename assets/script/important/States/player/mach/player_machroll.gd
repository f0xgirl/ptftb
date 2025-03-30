extends State_player
class_name Player_machroll

@export var sprite: AnimatedSprite2D 
@export var player: CharacterBody2D
@export var collision: CollisionShape2D
const PLAYER_CROUCHING = preload("res://resources/player/player_crouching.tres")
@onready var crouch_raycast_1: RayCast2D = $"../../crouch raycast1"
@onready var crouch_raycast_2: RayCast2D = $"../../crouch raycast2"

func Enter():
	collision.shape = PLAYER_CROUCHING
	DataPassthrough.player_state = "Player_machroll"
	
	
func Update(_delta: float):
	sprite.play("crawling")
	if not Input.is_action_pressed("action2"):
		Transitioned.emit(self,"player_slide")
	if not Input.is_action_pressed("down"):
		if above_head_empty():
			Transitioned.emit(self,"player_mach3")
	if player.is_on_wall():
		Transitioned.emit(self,"player_bumped")
	
func above_head_empty() -> bool:
	var result = !crouch_raycast_1.is_colliding() && !crouch_raycast_2.is_colliding()
	return result
