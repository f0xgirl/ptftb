extends State_player
class_name Player_roll

@export var sprite: AnimatedSprite2D 
@export var player: CharacterBody2D

func Enter():
	DataPassthrough.player_state = "player_roll"
