extends State
class_name Player_Idle

@export var sprite: AnimatedSprite2D 
@export var player: CharacterBody2D


func Enter():
	player.velocity.x = 0
	sprite.play("idle")

func Update(delta: float):
	if Input.is_action_pressed("left"):
		sprite.flip_h = true
		Transitioned.emit(self,"player_walking")
	elif Input.is_action_pressed("right"):
		sprite.flip_h = false
		Transitioned.emit(self,"player_walking")
	if Input.is_action_just_pressed("action1") and player.is_on_floor():
		Transitioned.emit(self,"player_jumping")
	if Input.is_action_just_pressed("action2"):
		Transitioned.emit(self,"player_mach1")
