extends State_player
##handles everything regarding the idle state for the player
class_name Player_Idle

@export var sprite: AnimatedSprite2D 
@export var player: CharacterBody2D
@export var collision: CollisionShape2D
@export var charge_effect: AnimatedSprite2D

const PLAYER_STANDING = preload("res://resources/player/player_standing.tres")

func Enter():
	charge_effect.visible = false
	collision.shape = PLAYER_STANDING
	player.velocity.x = 0
	if check_disabled() == true:
		print("disabled")

func Update(delta: float):
	if DataPassthrough.keep_state == true:
		Transitioned.emit(self,DataPassthrough.player_state)
		DataPassthrough.keep_state = false
		sprite.play(DataPassthrough.player_animation)
	if not player.is_on_floor():
		emit_signal("anim_change","fall",false)
		emit_signal("anim_offset",2,-16)
	else:
		emit_signal("anim_offset",2,-21)
		emit_signal("anim_change","idle",false)
		emit_signal("anim_override",true)
	if Input.is_action_pressed("left") and check_disabled() == false:
		Transitioned.emit(self,"player_walking")
	if Input.is_action_pressed("right") and check_disabled() == false:
		Transitioned.emit(self,"player_walking")
	if Input.is_action_pressed("up") and check_disabled() == false:
		emit_signal("anim_change","up_jump_prep", false)
		emit_signal("anim_override", false)
	if Input.is_action_just_pressed("action1") and player.is_on_floor() and Input.is_action_pressed("up") and check_disabled() == false:
		Transitioned.emit(self,"player_highjump")
	elif Input.is_action_just_pressed("action1") and player.is_on_floor() and check_disabled() == false:
		Transitioned.emit(self,"player_jumping")
	if Input.is_action_just_pressed("action2") and player.is_on_floor() and check_disabled() == false:
		Transitioned.emit(self,"player_mach1")
	if Input.is_action_just_pressed("down") and check_disabled() == false:
		Transitioned.emit(self,"player_idle_crouched")
	if Input.is_action_just_pressed("up") and player.grav_disable == true and check_disabled() == false:
		Transitioned.emit(self,"player_on_ladder")
	if player.state_override == true and check_disabled() == false:
		player.state_override = false
		Transitioned.emit(self,player.state_override_change)

func check_disabled() -> bool:
	if player.get_meta("disabled") == true:
		return true
	else:
		return false
