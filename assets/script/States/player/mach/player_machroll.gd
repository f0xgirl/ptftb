extends State
class_name Player_machroll

@export var sprite: AnimatedSprite2D 
@export var player: CharacterBody2D

func Enter():
	DataPassthrough.player_state = "Player_machroll"
