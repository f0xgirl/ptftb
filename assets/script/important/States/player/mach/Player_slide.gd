extends State_player
class_name Player_slide

var slide_progress: bool = false
@onready var stop: AudioStreamPlayer2D = %stop
@export var player: CharacterBody2D
@export var sprite: AnimatedSprite2D

func Enter():
	stop.play()
	sprite.play("slide_start")
	await sprite.animation_finished
	sprite.play("slide_loop")
	DataPassthrough.player_state = "player_slide"
	

func Pyhsics_Update(_delta: float):
	emit_signal("anim_offset",2,-7)
	player.velocity.x = move_toward(player.velocity.x, 0, 10)
	if player.velocity.x == 0:
		Transitioned.emit(self,"player_idle")
	
	
func Update(_delta: float):
	if player.is_on_wall():
		Transitioned.emit(self,"player_bumped")
	if player.state_override == true:
		player.state_override = false
		Transitioned.emit(self,player.state_override_change)
		
func Exit():
	sprite.play("slide_end")
