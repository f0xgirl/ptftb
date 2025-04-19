extends State_player
class_name player_frontwalk


@export var sprite: AnimatedSprite2D
@export var player: CharacterBody2D

func Enter() -> void:
	player.velocity.x = 0
	player.velocity.y = 0
	sprite.play("frontwalk")
	await sprite.animation_finished
	Transitioned.emit(self,"player_idle")
