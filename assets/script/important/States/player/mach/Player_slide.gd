extends State_player
class_name Player_slide

var slide_progress: bool = false
@export var player: CharacterBody2D
@export var sprite: AnimatedSprite2D

func Enter():
	DataPassthrough.player_state = "player_slide"
	

func Pyhsics_Update(_delta: float):
	if sprite.animation == "slide_start":
		if sprite.get_frame() == 6:
			sprite.play("slide_loop")
	player.velocity.x = move_toward(player.velocity.x, 0, 10)
	if player.velocity.x == 0:
		Transitioned.emit(self,"player_idle")
	
	
func Update(_delta: float):
	sprite.play("slide_start")
	if player.is_on_wall():
		Transitioned.emit(self,"player_bumped")
	if player.state_override == true:
		player.state_override = false
		Transitioned.emit(self,player.state_override_change)
func Exit():
	sprite.play("slide_end")
