extends State
class_name Player_mach2

@export var player: CharacterBody2D
@export var player_data: player_data
@export var sprite: AnimatedSprite2D


func Enter():
	sprite.play("mach2")
	
func Update(delta: float):
	if Input.is_action_just_released("action2"):
		Transitioned.emit(self,"Player_slide")
