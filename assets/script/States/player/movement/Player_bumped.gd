extends State
#whenever player hits a wall while in a mach state i.e sliding and running
class_name player_bumped

@export var sprite: AnimatedSprite2D 
@export var player: CharacterBody2D


func Enter():
	sprite.play("bumped")
	player.velocity.y = -350

func Update(delta: float):
	if player.is_on_floor():
		Transitioned.emit(self,"player_idle")
