extends CharacterBody2D
class_name peppino

@export var player_data: player_data
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@export var jump_velocity: int
@onready var camera: Camera2D = $Camera2D
@export var level_data: level_data
@onready var sprite: AnimatedSprite2D = $sprite
@onready var score_label: Label = %"score label"


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
	GlobalSignals.connect("add_score", add_points)
	get_parent().connect("player_limit_left", set_limit_left)
	get_parent().connect("player_limit_top", set_limit_top)
	get_parent().connect("player_limit_right", set_limit_right)
	get_parent().connect("player_limit_bottom", set_limit_bottom)
	#var toppin = TOPPIN_TEST.instantiate()
	#add_child(toppin)
	score_label.set_text(var_to_str(0))
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

func set_limit_left(val: int) -> void:
	camera.limit_left = val

func set_limit_top(val: int) -> void:
	camera.limit_top = val

func set_limit_right(val: int) -> void:
	camera.limit_right = val

func set_limit_bottom(val: int) -> void:
	camera.limit_bottom = val

func disable_gravity(grav: bool) -> void:
	grav_disable = grav
	
func ladder_stop() -> void:
	velocity.y += gravity

func set_pos(x: int, y: int) -> void:
	global_position.x = x
	global_position.y = y

func add_points(points):
	print("added")
	score += points
	score_label.set_text(var_to_str(score))

func points_clear():
	score = 0

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
