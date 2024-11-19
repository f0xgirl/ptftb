extends State
class_name Player_jumping

@export var player: CharacterBody2D
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@export var jump_velocity: int

func Enter():
	player.velocity.y = 1.1 * jump_velocity
	Transitioned.emit(self,"player_idle")

func Update(delta: float):
	if not player.is_on_floor():
		Transitioned.emit(self,"player_idle")
