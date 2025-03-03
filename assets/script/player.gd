extends CharacterBody2D
class_name peppino

@export var player_data: player_data
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@export var jump_velocity: int
@onready var camera: Camera2D = $Camera2D
@export var level_data: level_data
@onready var score: Label = $score/Control/MarginContainer/HBoxContainer/VBoxContainer/Label
@onready var sprite: AnimatedSprite2D = $sprite
const TOPPIN_TEST = preload("res://assets/scenes/level objects/toppin_test.tscn")
var force_direction: int
var state: State
var state_override: bool = false
var state_override_change: String
var grav_disable: bool = false
var still_in_ladder: bool = false


func _ready():
	var toppin = TOPPIN_TEST.instantiate()
	add_child(toppin)
	score.set_text(var_to_str(level_data.score))
	setcamboundaries()
	if DataPassthrough.player_pos_x:
		position.x = DataPassthrough.player_pos_x
		position.y = DataPassthrough.player_pos_y

func _physics_process(delta: float) -> void:
	if grav_disable == false:
		velocity.y += gravity * delta
	move_and_slide()
	if Input.is_action_just_pressed("pause"):
		get_tree().change_scene_to_file("res://assets/scenes/level_select.tscn")
		DataPassthrough.panic = false
		Globaltimer.stop()
		DataPassthrough.player_pos_x = 0
		DataPassthrough.player_pos_y = 0

func setcamboundaries():
	camera.limit_left = level_data.get_limit(0)
	camera.limit_top = level_data.get_limit(1)
	camera.limit_right = level_data.get_limit(2)
	camera.limit_bottom = level_data.get_limit(3)
func disable_gravity(grav: bool):
	grav_disable = grav
func ladder_stop():
	velocity.y += gravity

func change_state():
	pass


func _on_hot_sauce_body_entered(body: Node2D) -> void:
	state_override = true
	state_override_change = "player_fireass"


func _change_dir(dir: int) -> void:
	print("working")
	player_data.player_direction = dir

func fuck():
	print("fuck")
func _get_pos_x():
	return position.x
	
func _get_pos_y():
	return position.y
