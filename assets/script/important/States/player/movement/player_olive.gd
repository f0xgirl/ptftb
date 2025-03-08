extends State_player
class_name player_olive

@export var sprite: AnimatedSprite2D 
@export var player_data: player_data
@export var player: CharacterBody2D
var direction: int

func Enter():
	player.velocity.x = 0
	player.velocity.y = -100
	DataPassthrough.player_state = "Player_olive"

func Update(_delta: float):
	sprite.play("superjump")
	player.velocity.y += -50
	if player.is_on_ceiling():
		player.velocity.y = 500
	if Input.is_action_just_pressed("action1"):
		Transitioned.emit(self,"player_idle")
	direction = Input.get_axis("left","right")
	if player:
		player.velocity.x = direction * player_data.speed
