extends State
class_name Player_jumping

@export var player: CharacterBody2D
@export var player_data: player_data
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func Enter():
	player.velocity.y = 1.1 * player_data.jumpheight
	Transitioned.emit(self,"player_idle")
	DataPassthrough.player_state = "player_jumping"

func Update(delta: float):
	if not player.is_on_floor():
		Transitioned.emit(self,"player_idle")
