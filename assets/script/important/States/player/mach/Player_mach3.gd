extends State_player
class_name Player_mach3

signal metal_block_destroy(destroy: bool)

@export var player: CharacterBody2D
@export var player_data: player_data
@export var sprite: AnimatedSprite2D
@export var collision: CollisionShape2D
@export var charge_effect: AnimatedSprite2D
@onready var mach_3: AudioStreamPlayer2D = $"../../mach3"
@onready var check_collisions: Area2D = $"../../check_collisions"
var direction = Input.get_axis("left","right")
const PLAYER_STANDING = preload("res://resources/player/player_standing.tres")
var is_block: bool = false

func _ready() -> void:
	check_collisions.connect("is_block", check_for_block)
	check_collisions.connect("block_gone", no_more_block)

func Enter():
	mach_3.play()
	collision.shape = PLAYER_STANDING
	move_player()
	DataPassthrough.player_state = "player_mach3"
	

func Update(_delta: float):
	direction = Input.get_axis("left","right")
	emit_signal("anim_change","mach3",false)
	emit_signal("anim_offset",2,-5)
	if player.is_on_floor():
		if not Input.is_action_pressed("action2"):
			Transitioned.emit(self,"Player_slide")
	if Input.is_action_just_pressed("action1") and player.is_on_floor():
		player.velocity.y = 1.1 * - 350
	if player.is_on_wall():
		for index in player.get_slide_collision_count():
			var collider = player.get_slide_collision(index).get_collider()
			print(collider)
			if collider.name.begins_with("block") or collider.name.begins_with("metal"):
				collider.queue_free()
				move_player()
				break
			elif collider.name.begins_with("tileset"):
				if is_block == false:
					Transitioned.emit(self,"player_bumped")
	if Input.is_action_just_pressed("down") and not player.is_on_floor():
		Transitioned.emit(self,"Player_groundpound")
		emit_signal("metal_block_destroy", true)
	if Input.is_action_just_pressed("down"):
		Transitioned.emit(self,"player_machroll")
	if Input.is_action_just_pressed("up"):
		Transitioned.emit(self,"Player_superjump")
	if direction != player_data.player_direction and not direction == 0 and player.is_on_floor():
		Transitioned.emit(self,"Player_turn")
	if player.state_override == true:
		player.state_override = false
		Transitioned.emit(self,player.state_override_change)

func Exit():
	mach_3.stop()
	is_block = false

func move_player():
	player.velocity.x = player_data.player_direction * player_data.mach3_speed

func check_for_block() -> void:
	is_block = true

func no_more_block() -> void:
	is_block = false
