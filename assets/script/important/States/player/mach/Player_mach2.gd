extends State_player
class_name Player_mach2


@export var player: CharacterBody2D
@export var player_data: player_data
@export var sprite: AnimatedSprite2D
## amount of "time" until it switches to Player_mach3.
var tillmach3: float = 300
@onready var mach_2: AudioStreamPlayer2D = $"../../mach2"
var direction = Input.get_axis("left","right")
var is_block: bool = false
@onready var check_collisions: Area2D = $"../../check_collisions"
const BLOCK_SMALL = preload("res://assets/scenes/level objects/block_small.tscn")

func _ready() -> void:
	check_collisions.connect("is_block", check_for_block)
	check_collisions.connect("block_gone", no_more_block)

func Enter():
	#player.afterimage_add()
	mach_2.play()
	move_player()
	tillmach3 = DataPassthrough.player_tillmach3
	DataPassthrough.player_state = "player_mach2"
	

func Update(_delta: float):
	player.afterimage_add()
	direction = Input.get_axis("left","right")
	emit_signal("anim_change","mach2", false)
	emit_signal("anim_offset",2, -5)
	DataPassthrough.player_tillmach3 = tillmach3
	if player.is_on_floor():
		if not Input.is_action_pressed("action2"):
			Transitioned.emit(self,"Player_slide")
	if Input.is_action_just_pressed("action1") and player.is_on_floor():
		player.velocity.y = 1.1 * - 350
	#wall collision
	if player.is_on_wall():
		for index in player.get_slide_collision_count():
			var collider = player.get_slide_collision(index).get_collider()
			print(collider)
			if collider.name.begins_with("block"):
				collider.queue_free()
				move_player()
				break
			else:
				if is_block == false or collider.name.begins_with("metal"):
					Transitioned.emit(self,"player_bumped")
	
	if Input.is_action_just_pressed("down"):
		Transitioned.emit(self,"player_roll")
	
	# checking if turning
	if direction != player_data.player_direction and not direction == 0 and player.is_on_floor():
		Transitioned.emit(self,"Player_turn")
	if player.state_override == true:
		player.state_override = false
		Transitioned.emit(self,player.state_override_change)

	
func Pyhsics_Update(_delta: float):
	if player.is_on_floor():
		tillmach3 -= 200 * _delta
	if tillmach3 < 0:
		Transitioned.emit(self,"player_mach3")

func Exit():
	DataPassthrough.player_tillmach3 = 300
	mach_2.stop()
	is_block = false

func check_for_block() -> void:
	is_block = true

func no_more_block() -> void:
	is_block = false

func _on_mach_2_finished() -> void:
	mach_2.play()

func move_player():
	player.velocity.x = player_data.player_direction * player_data.mach2_speed

func change_sprite_offset(x: int, y: int) -> void:
	sprite.offset.x = x
	sprite.offset.y = y
