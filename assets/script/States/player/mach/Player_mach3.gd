extends State
class_name Player_mach3

@export var player: CharacterBody2D
@export var player_data: player_data
@export var sprite: AnimatedSprite2D

# TODO: super jumping ground pounding and interactions with stuff

func Enter():
	player.velocity.x = player_data.mach3_speed
	sprite.play("mach3")
	
func Update(_delta: float):
	if player.is_on_floor():
		if not Input.is_action_pressed("action2"):
			Transitioned.emit(self,"Player_slide")
	if Input.is_action_just_pressed("action1") and player.is_on_floor():
		player.velocity.y = 1.1 * - 350
	if player.is_on_wall():
		Transitioned.emit(self,"player_bumped")
	if Input.is_action_just_pressed("down"):
		Transitioned.emit(self,"Player_groundpound")
	if Input.is_action_just_pressed("up"):
		Transitioned.emit(self,"Player_superjump")
