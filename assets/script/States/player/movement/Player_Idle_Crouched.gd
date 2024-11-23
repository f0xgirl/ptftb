extends State
class_name Player_Idle_Crouched

@export var sprite: AnimatedSprite2D
@export var player_data: player_data
@export var player: CharacterBody2D
@export var collision: CollisionShape2D
const PLAYER_CROUCHING = preload("res://resources/player/player_crouching.tres")

func Enter():
	collision.shape = PLAYER_CROUCHING
	sprite.play("crawling_idle")
	player.velocity.x = 0
	DataPassthrough.player_state = "Player_Idle_Crouched"

func Update(_delta: float):
	if player.is_on_floor():
		sprite.play("crawling_idle")
	if Input.is_action_just_pressed("action1") and player.is_on_floor():
		sprite.play("crawling air")
		player.velocity.y = player_data.jumpheight
	if not player.is_on_floor():
		sprite.play("crawling air")
	if not Input.is_action_pressed("down"):
		Transitioned.emit(self,"player_idle")
	if Input.is_action_pressed("left"):
		Transitioned.emit(self,"player_crawling")
	elif Input.is_action_pressed("right"):
		Transitioned.emit(self,"player_crawling")
