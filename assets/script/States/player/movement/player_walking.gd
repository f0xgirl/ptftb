extends State
class_name Player_walking

@export var player: CharacterBody2D
@export var player_data: player_data
@export var sprite: AnimatedSprite2D
var direction = Input.get_axis("left","right")

func move(direction: int):
	direction = Input.get_axis("left","right")
	
func Enter():
	sprite.play("walking")
	move(direction)
	
func Update(delta: float):
	if player.is_on_floor() == false:
		sprite.play("fall")
	else:
		sprite.play("walking")
	direction = Input.get_axis("left","right")
	move(direction)
	print(direction)
	if direction == 0:
		Transitioned.emit(self,"player_idle")
	if Input.is_action_just_pressed("action1") and player.is_on_floor():
		Transitioned.emit(self,"player_jumping")
	if Input.is_action_just_pressed("action2"):
		Transitioned.emit(self,"player_mach1")

func Pyhsics_Update(delta: float):
	if player:
		player.velocity.x = direction * player_data.speed
		
	
	
