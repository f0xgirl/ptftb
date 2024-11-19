extends State
class_name Player_Superjump

@export var sprite: AnimatedSprite2D 
@export var player: CharacterBody2D

func Enter():
	sprite.play("superjump")
	player.velocity.x = 0
	player.velocity.y = -100

func Update(_delta: float):
	player.velocity.y += -100
	if player.is_on_ceiling():
		Transitioned.emit(self,"Player_idle")
