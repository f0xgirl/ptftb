extends State
class_name Player_mach3

@export var player: CharacterBody2D
@export var player_data: player_data
@export var sprite: AnimatedSprite2D
@export var collision: CollisionShape2D
@export var charge_effect: AnimatedSprite2D
@onready var mach_3: AudioStreamPlayer2D = $"../../mach3"

const PLAYER_STANDING = preload("res://resources/player/player_standing.tres")


func Enter():
	mach_3.play()
	collision.shape = PLAYER_STANDING
	player.velocity.x = player_data.player_direction * player_data.mach3_speed
	DataPassthrough.player_state = "player_mach3"
	
func Update(_delta: float):
	charge_effect.visible = true
	sprite.play("mach3")
	if player.is_on_floor():
		if not Input.is_action_pressed("action2"):
			Transitioned.emit(self,"Player_slide")
	if Input.is_action_just_pressed("action1") and player.is_on_floor():
		player.velocity.y = 1.1 * - 350
	if player.is_on_wall():
		Transitioned.emit(self,"player_bumped")
	if Input.is_action_just_pressed("down") and not player.is_on_floor():
		Transitioned.emit(self,"Player_groundpound")
	if Input.is_action_just_pressed("down"):
		Transitioned.emit(self,"player_machroll")
	if Input.is_action_just_pressed("up"):
		Transitioned.emit(self,"Player_superjump")

func Exit():
	mach_3.stop()