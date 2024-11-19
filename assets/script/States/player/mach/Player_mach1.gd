extends State
class_name Player_mach1

var till_mach2 = 100 #cool ass name
var direction: int
@export var player: CharacterBody2D
@export var player_data: player_data
@export var sprite: AnimatedSprite2D


func Enter():
	print(player_data.player_direction)
	player.velocity.x = 0
	sprite.play("mach1")

func Update(delta: float):
	#till_mach2 -=  1
	if Input.is_action_pressed("action2"):
		player.velocity.x += player_data.player_direction * player_data.mach1_speed
	if till_mach2 == 0:
		Transitioned.emit(self,"player_mach2")
	if Input.is_action_just_released("action2"):
		print("slide")
		Transitioned.emit(self,"player_slide")
	if Input.is_action_just_pressed("action1"):
		Transitioned.emit(self,"player_jumping")
	if sprite.get_frame() == 15:
		print("hi")
		Transitioned.emit(self,"player_mach2")

func Physic_Update(delta: float):
	pass
