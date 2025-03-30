extends State_player
class_name Player_mach1

var till_mach2 = 100 #cool ass name
var direction: int
@export var player: CharacterBody2D
@export var player_data: player_data
@export var sprite: AnimatedSprite2D
@onready var mach_1: AudioStreamPlayer2D = $"../../mach1"




func Enter():
	mach_1.play()
	#Audioplayer._play_sfx_mach1()
	player.velocity.x = 0

	DataPassthrough.player_state = "player_mach1"

func Update(_delta: float):
	sprite.play("mach1")
	emit_signal("anim_offset",2,-5)
	if Input.is_action_pressed("action2"):
		player.velocity.x += player_data.player_direction * player_data.mach1_speed
	if till_mach2 == 0:
		Transitioned.emit(self,"player_mach2")
	if Input.is_action_just_released("action2"):
		Transitioned.emit(self,"player_slide")
	if Input.is_action_just_pressed("action1"):
		Transitioned.emit(self,"player_jumping")
	if sprite.get_frame() == 15:
		Transitioned.emit(self,"player_mach2")
	if player.state_override == true:
		player.state_override = false
		Transitioned.emit(self,player.state_override_change)
	

func Exit():
	mach_1.stop()
