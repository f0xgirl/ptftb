extends State
class_name Player_mach2

@export var player: CharacterBody2D
@export var player_data: player_data
@export var sprite: AnimatedSprite2D
var tillmach3: float = 300
@onready var mach_2: AudioStreamPlayer2D = $"../../mach2"
@onready var mach_1: AudioStreamPlayer2D = $"../../mach1"

func Enter():
	mach_2.play()
	print(DataPassthrough.keep_state)
	player.velocity.x = player_data.player_direction * player_data.mach2_speed
	tillmach3 = DataPassthrough.player_tillmach3
	DataPassthrough.player_state = "player_mach2"

func Update(_delta: float):
	sprite.play("mach2")
	DataPassthrough.player_tillmach3 = tillmach3
	if player.is_on_floor():
		if not Input.is_action_pressed("action2"):
			Transitioned.emit(self,"Player_slide")
	if Input.is_action_just_pressed("action1") and player.is_on_floor():
		player.velocity.y = 1.1 * - 350
	if player.is_on_wall():
		Transitioned.emit(self,"player_bumped")

	
func Pyhsics_Update(_delta: float):
	if player.is_on_floor():
		tillmach3 -= 200 * _delta
	print(tillmach3)
	if tillmach3 < 0:
		Transitioned.emit(self,"player_mach3")

func Exit():
	DataPassthrough.player_tillmach3 = 300
	mach_2.stop()



func _on_mach_2_finished() -> void:
	mach_2.play()
