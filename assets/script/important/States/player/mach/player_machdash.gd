extends State_player
class_name player_machdash

## Player
@export var player: CharacterBody2D
@export var sprite: AnimatedSprite2D
## Player data
@export var player_data: player_data

func Enter():
	player.velocity.x = player.force_direction * player_data.mach3_speed
	player_data.player_direction = player.force_direction
	match player.force_direction:
		-1:
			sprite.flip_h = true
		1:
			sprite.flip_h = false
	player.velocity.x = player_data.player_direction * player_data.mach3_speed
	

func Update(_delta: float):
	Transitioned.emit(self,"player_mach3")
