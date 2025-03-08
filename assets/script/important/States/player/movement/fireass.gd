extends State_player
class_name fireass

@export var sprite: AnimatedSprite2D
@export var player: CharacterBody2D

func Enter():
	DataPassthrough.player_state = "player_fireass"
	player.velocity.y = -1000

func Update(_delta: float):
	Transitioned.emit(self,"player_idle")
