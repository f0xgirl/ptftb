extends State_player

## Peppino rocket transformation
class_name rocket_pep

## Player
@export var player: CharacterBody2D
@export var sprite: AnimatedSprite2D
## Player data
@export var player_data: player_data
@onready var mach_4: AudioStreamPlayer2D = %mach4


func Enter():
	mach_4.play()
	player.velocity.x = player.force_direction * player_data.mach3_speed
	player_data.player_direction = player.force_direction
	match player.force_direction:
		-1:
			sprite.flip_h = true
		1:
			sprite.flip_h = false

func Update(_delta: float):
	if Input.is_action_pressed("up"):
		player.velocity.y = -200
	if Input.is_action_just_pressed("action1"):
		Transitioned.emit(self,"Player_mach3")
	if player.is_on_wall():
		Transitioned.emit(self,"Player_bumped")

func Exit():
	mach_4.stop()
