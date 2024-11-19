extends State
class_name Player_falling

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@export var player: CharacterBody2D

func Physics_Update(delta: float):
	if not player.is_on_floor():
		player.velocity.y += gravity * delta
