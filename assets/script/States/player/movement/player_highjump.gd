extends State
class_name Player_highjump

@export var player: CharacterBody2D
@export var player_data: player_data
@export var sprite: AnimatedSprite2D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func Enter():
	DataPassthrough.player_state = "player_highjump"
	player.velocity.y = 1.3 * player_data.jumpheight
	Transitioned.emit(self,"player_idle")

func Update(delta: float):
	if not player.is_on_floor():
		Transitioned.emit(self,"player_idle")