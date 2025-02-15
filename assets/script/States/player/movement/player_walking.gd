extends State
class_name Player_walking

@export var player: peppino
@export var player_data: player_data
@export var sprite: AnimatedSprite2D
var direction = Input.get_axis("left","right")

func Enter():
	DataPassthrough.player_state = "player_walking"
	
func Update(delta: float):
	if player.is_on_floor() == false:
		sprite.play("fall")
	else:
		sprite.play("walking")
	direction = Input.get_axis("left","right")
	sprite_flip()
	if direction == 0:
		Transitioned.emit(self,"player_idle")
	if direction != 0:
		player_data.player_direction = direction
	if Input.is_action_just_pressed("action1") and player.is_on_floor():
		Transitioned.emit(self,"player_jumping")
	if Input.is_action_just_pressed("action2") and player.is_on_floor():
		Transitioned.emit(self,"player_mach1")
	if player.is_in_group("hotsauce"):
		print("owww")
	if player.state_override == true:
		player.state_override = false
		Transitioned.emit(self,player.state_override_change)

func Pyhsics_Update(delta: float):
	if player:
		player.velocity.x = direction * player_data.speed
		

func sprite_flip():
	if player_data.player_direction == 1:
		sprite.offset.x = 0
		sprite.flip_h = false
	else:
		sprite.offset.x = -8
		sprite.flip_h = true
