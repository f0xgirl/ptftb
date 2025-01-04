extends State
class_name Player_turn

@export var sprite: AnimatedSprite2D 
@export var player: CharacterBody2D

func Enter():
	DataPassthrough.player_state = "player_turn"

func Physics_Update(delta: float):
	player.velocity.x = move_toward(player.velocity.x, 0, -300)

func Update(delta: float):
	if Input.is_action_just_released("action2"):
		Transitioned.emit(self,"Player_slide")
