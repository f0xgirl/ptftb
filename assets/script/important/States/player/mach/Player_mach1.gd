extends State_player
class_name Player_mach1

var till_mach2: int = 100 #cool ass name
var direction: int
var weirdmachjump: bool = false

@export var player: CharacterBody2D
@export var player_data: player_data
@export var sprite: AnimatedSprite2D
@onready var mach_1: AudioStreamPlayer2D = $"../../mach1"




func Enter():
	sprite.play("mach1")
	mach_1.play()
	#Audioplayer._play_sfx_mach1()
	player.velocity.x = 0

	DataPassthrough.player_state = "player_mach1"

func Update(_delta: float):
	direction = Input.get_axis("left","right")
	
	emit_signal("anim_offset",2,-5)
	if weirdmachjump == true:
		if player.velocity.y < 0 and not player.is_on_floor():
			if sprite.animation == "jump2":
				await sprite.animation_finished
				sprite.play("fall2")
	if player.is_on_floor() and weirdmachjump == true:
		weirdmachjump = false
		sprite.play("mach1")
		mach_1.play()
		player.velocity.x = 0
		
	if Input.is_action_pressed("action2") and weirdmachjump == false:
		player.velocity.x += player_data.player_direction * player_data.mach1_speed
	if till_mach2 == 0:
		Transitioned.emit(self,"player_mach2")
	if Input.is_action_just_released("action2") and weirdmachjump == false:
		Transitioned.emit(self,"player_slide")
	if Input.is_action_just_pressed("action1") and player.is_on_floor():
		weirdmachjump = true
		player.velocity.x = 200 * player_data.player_direction
		sprite.play("jump2")
		player.velocity.y = 1.1 * - 350
		mach_1.stop()
	if sprite.get_frame() == 15:
		Transitioned.emit(self,"player_mach2")
	if player.state_override == true:
		player.state_override = false
		Transitioned.emit(self,player.state_override_change)
	if player.is_on_wall():
		if weirdmachjump == true:
			Transitioned.emit(self,"player_bumped")
		else:
			Transitioned.emit(self,"player_idle")
	#if player presses other direction
	if direction != player_data.player_direction and not direction == 0 and player.is_on_floor():
		flip_sprite()
		mach_1.stop()
		sprite.set_frame(0)
		till_mach2 = 100
		mach_1.play()
		player.velocity.x = 0
		sprite.play("mach1")
		player_data.player_direction = direction
		

func Exit():
	mach_1.stop()
	weirdmachjump = false

func flip_sprite() -> void: #equals 1: right equals -1: left
	match player_data.player_direction:
		1:
			sprite.flip_h = true
		-1:
			sprite.flip_h = false
