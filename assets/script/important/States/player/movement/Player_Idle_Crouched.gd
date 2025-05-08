extends State_player
class_name Player_Idle_Crouched

@export var sprite: AnimatedSprite2D
@export var player_data: player_data
@export var player: CharacterBody2D
@export var collision: CollisionShape2D
const PLAYER_CROUCHING = preload("res://resources/player/player_crouching.tres")
@onready var crouch_raycast_1: RayCast2D = $"../../crouch raycast1"
@onready var crouch_raycast_2: RayCast2D = $"../../crouch raycast2"


func Enter():
	collision.shape = PLAYER_CROUCHING
	sprite.play("crawling_idle")
	player.velocity.x = 0
	DataPassthrough.player_state = "Player_Idle_Crouched"
	emit_signal("anim_offset",2,-3)

func Update(_delta: float):
	if player.is_on_floor():
		sprite.play("crawling_idle")
	if Input.is_action_just_pressed("action1") and player.is_on_floor():
		sprite.play("crawling_jump")
		player.velocity.y = player_data.jumpheight
	if not player.is_on_floor():
		if sprite.animation == "crawling_jump":
			await sprite.animation_finished
			sprite.play("crawling air")
			emit_signal("anim_offset",2,-5)
	if not Input.is_action_pressed("down") and player.is_on_floor():
		if above_head_empty():
			player.position.y -= 15
			Transitioned.emit(self,"player_idle")
	if Input.is_action_pressed("left"):
		Transitioned.emit(self,"player_crawling")
	elif Input.is_action_pressed("right"):
		Transitioned.emit(self,"player_crawling")

func above_head_empty() -> bool:
	var result = !crouch_raycast_1.is_colliding() && !crouch_raycast_2.is_colliding()
	return result
