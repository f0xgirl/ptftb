extends State
class_name Player_turn

@export var sprite: AnimatedSprite2D 
@export var player_data: player_data
@export var player: CharacterBody2D
var direction = Input.get_axis("left","right")

func Enter():
	direction = Input.get_axis("left","right")
	sprite.play("slide_loop")
	DataPassthrough.player_state = "player_turn"


func Update(delta: float):
	player.velocity.x = move_toward(player.velocity.x, 0, 15)
	if player.velocity.x == 0:
		player_data.player_direction = direction
		Transitioned.emit(self,"player_mach2")
	if Input.is_action_just_released("action2"):
		Transitioned.emit(self,"Player_slide")
	if player.is_on_wall():
		Transitioned.emit(self,"player_bumped")
