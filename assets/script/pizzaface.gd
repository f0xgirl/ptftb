@icon("res://assets/sprites/spr_pizzaface_0.png")
extends Node2D

@onready var player: peppino = get_parent().get_child(0)
@onready var spawn_in: Timer = $"spawn"
@onready var moving: AudioStreamPlayer2D = $moving
@onready var collision: CollisionShape2D = $Area2D/CollisionShape2D
@onready var sprite: AnimatedSprite2D = $sprite
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var afterimagetimer: Timer = $afterimagetimer

const PIZZAFACE_AFTERIMAGE = preload("res://assets/scenes/pizzaface_afterimage.tscn")

var can_move: bool = false
var player_pos
var target_pos
var level_exitinfo: level_info
@export var speed: int

func _ready() -> void:
	afterimage_add()
	sprite.play("spawn")
	animation_player.play("spawn_in")
	Audioplayer._play_sfx_pizzalaugh()
	moving.play()
	position = player.position
	GlobalSignals.connect("move", set_pos)
	spawn_in.start()


func _physics_process(delta: float) -> void:
	player_pos = player.position
	target_pos = (player_pos - position ).normalized()
	if can_move == true:
		position += target_pos * speed * delta

func set_pos(x: int, y: int) -> void:
	animation_player.play("spawn_in")
	collision.set_deferred("disabled", true)
	can_move = false
	global_position.x = x
	global_position.y = y
	spawn_in.start()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		GlobalSignals.emit_signal("change_state", "player_idle", NAN)
		get_parent().call("clear_rooms")
		get_parent().call("load_caught")
		get_parent().emit_signal("kill_pizzaface")


func _on_spawn_timeout() -> void:
	print("timeout")
	collision.set_deferred("disabled", false)
	can_move = true

func afterimage_add():
	afterimagetimer.start()
	print("working")
	var afterimage = PIZZAFACE_AFTERIMAGE.instantiate()
	afterimage.set_spriteframes(sprite.sprite_frames)
	afterimage.set_sprite_offset(sprite.offset.x, sprite.offset.y)
	afterimage.set_sprite_flip(sprite.flip_h)
	afterimage.set_animation_and_frames(sprite.animation, sprite.frame)
	afterimage.set_sprite_gpos(position)
	get_parent().add_child(afterimage)


func _on_afterimagetimer_timeout() -> void:
	afterimage_add()
