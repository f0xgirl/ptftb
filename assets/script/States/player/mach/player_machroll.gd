extends State
class_name Player_machroll

@export var sprite: AnimatedSprite2D 
@export var player: CharacterBody2D
@export var collision: CollisionShape2D
const PLAYER_CROUCHING = preload("res://resources/player/player_crouching.tres")


func Enter():
	collision.shape = PLAYER_CROUCHING
	DataPassthrough.player_state = "Player_machroll"
	
	
func Update(_delta: float):
	sprite.play("crawling")
	if not Input.is_action_pressed("action2"):
		Transitioned.emit(self,"player_slide")
	if not Input.is_action_pressed("down"):
		Transitioned.emit(self,"player_mach3")
	if player.is_on_wall():
		Transitioned.emit(self,"player_bumped")
		
