extends State

@export var sprite: AnimatedSprite2D 
@export var player: CharacterBody2D

func Enter():
	player.velocity.x = 0

func Update(_delta: float):
	player.velocity.y = 0
	if Input.is_action_just_pressed("up"):
		player.velocity.y = -350
