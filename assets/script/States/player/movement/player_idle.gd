extends State
class_name Player_Idle

@export var sprite: AnimatedSprite2D 
@export var player: CharacterBody2D


func Enter():
	player.velocity.x = 0

func Update(delta: float):
	if not player.is_on_floor():
		sprite.play("fall")
	else:
		sprite.play("idle")
	if Input.is_action_pressed("left"):
		Transitioned.emit(self,"player_walking")
	if Input.is_action_pressed("right"):
		Transitioned.emit(self,"player_walking")
	if Input.is_action_just_pressed("action1") and player.is_on_floor() and Input.is_action_pressed("up"):
		Transitioned.emit(self,"player_highjump")
	elif Input.is_action_just_pressed("action1") and player.is_on_floor():
		Transitioned.emit(self,"player_jumping")
	if Input.is_action_just_pressed("action2"):
		Transitioned.emit(self,"player_mach1")
