extends State
class_name Player_mach2

@export var player: CharacterBody2D
@export var player_data: player_data
@export var sprite: AnimatedSprite2D


func Enter():
	sprite.play("mach2")
	
func Update(delta: float):
	if player.is_on_floor():
		if not Input.is_action_pressed("action2"):
			Transitioned.emit(self,"Player_slide")
	if Input.is_action_just_pressed("action1") and player.is_on_floor():
		player.velocity.y = 1.1 * - 350
	if player.is_on_wall():
		Transitioned.emit(self,"player_bumped")
