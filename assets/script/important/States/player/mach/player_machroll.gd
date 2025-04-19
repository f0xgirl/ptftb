extends State_player
class_name Player_machroll

@export var sprite: AnimatedSprite2D 
@export var player: CharacterBody2D
@export var player_data: player_data
@export var collision: CollisionShape2D
const PLAYER_CROUCHING = preload("res://resources/player/player_crouching.tres")
@onready var crouch_raycast_1: RayCast2D = $"../../crouch raycast1"
@onready var crouch_raycast_2: RayCast2D = $"../../crouch raycast2"
@onready var check_collisions: Area2D = $"../../check_collisions"

var is_block: bool = false

func _ready() -> void:
	check_collisions.connect("is_block", check_for_block)
	check_collisions.connect("block_gone", no_more_block)

func Enter():
	collision.shape = PLAYER_CROUCHING
	DataPassthrough.player_state = "Player_machroll"
	
	
func Update(_delta: float):
	emit_signal("anim_offset",2, -33)
	sprite.play("mach_roll")
	if not Input.is_action_pressed("action2"):
		Transitioned.emit(self,"player_slide")
	if not Input.is_action_pressed("down"):
		if above_head_empty():
			Transitioned.emit(self,"player_mach3")
	if player.is_on_wall():
		for index in player.get_slide_collision_count():
			var collider = player.get_slide_collision(index).get_collider()
			print(collider)
			if collider.name.begins_with("block"):
				collider.queue_free()
				move_player()
				check_collisions.emit_signal("block_gone")
				index = 0
			elif collider.name.begins_with("tileset"):
				if is_block == false:
					Transitioned.emit(self,"player_bumped")
	
func above_head_empty() -> bool:
	var result = !crouch_raycast_1.is_colliding() && !crouch_raycast_2.is_colliding()
	return result

func check_for_block() -> void:
	is_block = true

func no_more_block() -> void:
	is_block = false

func move_player():
	player.velocity.x = player_data.player_direction * player_data.mach3_speed
