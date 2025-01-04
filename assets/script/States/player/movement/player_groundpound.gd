extends State
class_name Player_groundpound

@export var sprite: AnimatedSprite2D 
@export var player: CharacterBody2D

func Enter():
	DataPassthrough.player_state = "player_groundpound"

func Update(_delta: float):
	if player.is_on_floor():
		Transitioned.emit(self,"Player_idle")
