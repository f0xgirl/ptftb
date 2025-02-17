extends State_player
class_name player_on_ladder

@export var sprite: AnimatedSprite2D 
@export var player: peppino


func Enter():
	DataPassthrough.player_state = "player_on_ladder"
	player.velocity.x = 0
	player.velocity.y = 0

func Update(_delta: float):
	player.velocity.y = 0
	if Input.is_action_pressed("up"):
		player.velocity.y = -100
	elif Input.is_action_pressed("down"):
		player.velocity.y = 350
	if player.grav_disable == false:
		Transitioned.emit(self,"player_idle")
	if Input.is_action_just_pressed("action1"):
		player.grav_disable = false
		print("jumping")
		Transitioned.emit(self,"player_jumping")
