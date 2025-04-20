extends State_player
class_name player_on_ladder

@export var sprite: AnimatedSprite2D 
@export var player: peppino


func Enter():
	player.set_collision_mask_value(5, false)
	player.grav_disable = true
	player.state_override = false
	DataPassthrough.player_state = "player_on_ladder"
	player.velocity.x = 0
	player.velocity.y = 0

func Update(_delta: float):
	player.velocity.y = 0
	if Input.is_action_pressed("up"):
		sprite.play("ladder up")
		player.velocity.y = -100
	elif Input.is_action_pressed("down"):
		sprite.play("ladder down")
		player.velocity.y = 350
	if player.grav_disable == false:
		Transitioned.emit(self,"player_idle")
	if Input.is_action_just_pressed("action1"):
		Transitioned.emit(self,"player_jumping")
	if player.state_override == true:
		player.state_override = false
		Transitioned.emit(self,player.state_override_change)
		player.state_override_change = ""
	if player.velocity.y == 0:
		sprite.play("ladder up")
		sprite.set_frame(0)
		sprite.pause()

func Exit():
	player.set_collision_mask_value(5, true)
	player.grav_disable = false
