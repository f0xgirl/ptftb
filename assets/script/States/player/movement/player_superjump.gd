extends State_player
class_name Player_Superjump

@export var sprite: AnimatedSprite2D 
@export var player: CharacterBody2D

func Enter():
	player.velocity.x = 0
	player.velocity.y = -100
	DataPassthrough.player_state = "Player_Superjump"

func Update(_delta: float):
	sprite.play("superjump")
	player.velocity.y += -100
	if player.is_on_ceiling():
		Transitioned.emit(self,"Player_idle")
