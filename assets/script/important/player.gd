extends CharacterBody2D
class_name peppino

@export var player_data: player_data
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@export var jump_velocity: int
@onready var camera: Camera2D = $Camera2D
@export var level_data: level_data
@onready var score_text: Label = $score/Control/MarginContainer/HBoxContainer/VBoxContainer/Label
@onready var sprite: AnimatedSprite2D = $sprite

const TOPPIN_TEST = preload("res://assets/scenes/level objects/toppin_test.tscn")
const LEVEL_SELECT = preload("res://assets/scenes/level_select.tscn")

var score: int = 0
var force_direction: int
var state: State
var state_override: bool = false
var state_override_change: String
var grav_disable: bool = false
var still_in_ladder: bool = false


func _ready() -> void:
	GlobalSignals.connect("move", set_pos)
	var toppin = TOPPIN_TEST.instantiate()
	#add_child(toppin)
	score_text.set_text(var_to_str(score))
	setcamboundaries()
	if DataPassthrough.player_pos_x:
		position.x = DataPassthrough.player_pos_x
		position.y = DataPassthrough.player_pos_y

func _physics_process(delta: float) -> void:
	if grav_disable == false:
		velocity.y += gravity * delta
	move_and_slide()
	if Input.is_action_just_pressed("pause"):
		var lvl = LEVEL_SELECT.instantiate()
		get_parent().call("clear_rooms") #clears rooms
		get_parent().call("disable_player", true) #disables player from moving
		DataPassthrough.panic = false
		Globaltimer.stop()
		DataPassthrough.player_pos_x = 0
		DataPassthrough.player_pos_y = 0
		get_parent().add_child(lvl)

## sets camera boundaries TODO: fix them
func setcamboundaries() -> void:
	#camera.limit_left = level_data.get_limit(0)
	#camera.limit_top = level_data.get_limit(1)
	#camera.limit_right = level_data.get_limit(2)
	#camera.limit_bottom = level_data.get_limit(3)
	pass
	
func disable_gravity(grav: bool) -> void:
	grav_disable = grav
	
func ladder_stop() -> void:
	velocity.y += gravity

func set_pos(x: int, y: int) -> void:
	global_position.x = x
	global_position.y = y

func _on_hot_sauce_body_entered(body: Node2D) -> void:
	state_override = true
	state_override_change = "player_fireass"


func _change_dir(dir: int) -> void:
	player_data.player_direction = dir

func player_enabled() -> void:
	show()

func player_disabled() -> void:
	hide()

func fuck() -> void:
	print("fuck")

func _get_pos_x() -> int:
	return position.x

func _get_pos_y() -> int:
	return position.y
