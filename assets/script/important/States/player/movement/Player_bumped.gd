extends State_player
#whenever player hits a wall while in a mach state i.e sliding and running
class_name player_bumped

@export var sprite: AnimatedSprite2D
@export var player_data: player_data
@export var player: CharacterBody2D
@export var collision: CollisionShape2D


const PLAYER_STANDING = preload("res://resources/player/player_standing.tres")


func Enter():
	collision.shape = PLAYER_STANDING
	
	player.velocity.y = -150
	player.velocity.x = player_data.player_direction * 100 * -1
	DataPassthrough.player_state = "player_bumped"
	

func Update(delta: float):
	sprite.play("bumped")
	if player.is_on_floor():
		Transitioned.emit(self,"player_idle")
	if player.state_override == true:
		player.state_override = false
		Transitioned.emit(self,player.state_override_change)
