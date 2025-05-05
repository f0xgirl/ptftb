extends State_player
class_name Player_turn

@export var sprite: AnimatedSprite2D 
@export var player_data: player_data
@export var player: CharacterBody2D
@onready var turn: AudioStreamPlayer2D = $"../../turn"
var direction: int

func Enter():
	turn.play()
	if player_data.player_direction == 1:
		direction = -1
	elif player_data.player_direction == -1:
		direction = 1
	sprite.play("slide_start")
	await sprite.animation_finished
	sprite.play("slide_loop")
	DataPassthrough.player_state = "player_turn"


func Update(_delta: float):
	player.velocity.x = move_toward(player.velocity.x, 0, 15)
	if player.velocity.x == 0:
		player_data.player_direction = direction
		flip_sprite()
		Transitioned.emit(self,"player_mach2")
	if player.is_on_wall():
		Transitioned.emit(self,"player_bumped")


func flip_sprite() -> void: #equals 1: right equals -1: left
	match player_data.player_direction:
		1:
			sprite.flip_h = false
		-1:
			sprite.flip_h = true
