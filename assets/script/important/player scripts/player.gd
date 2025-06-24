extends CharacterBody2D
class_name peppino

@export var player_data: player_data
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@export var jump_velocity: int
@onready var camera: Camera2D = $Camera
@export var level_data: level_data
@onready var sprite: AnimatedSprite2D = $sprite
@onready var score_label: Label = %"score label"
@onready var afterimagetimer: Timer = $afterimagetimer

const SPRITE_AFTERIMAGE = preload("res://assets/scenes/playermach2_afterimage.tscn")
const TOPPIN_TEST = preload("res://assets/scenes/level objects/toppin_test.tscn")
const LEVEL_SELECT = preload("res://assets/scenes/level_select.tscn")
const HUB_1 = preload("res://assets/scenes/levels/hubs/hub1_1.tscn")

var score: int = 0
var level_name: String
var force_direction: int
var state: State
var state_override: bool = false
var state_override_change: String
var grav_disable: bool = false
var still_in_ladder: bool = false
var has_key: bool = false


func _ready() -> void:
	GlobalSignals.connect("move", set_pos)
	GlobalSignals.connect("add_score", add_points)
	GlobalSignals.connect("change_state", change_state)
	get_parent().connect("send_level_name", get_level_name)
	get_parent().connect("player_limit_left", set_limit_left)
	get_parent().connect("player_limit_top", set_limit_top)
	get_parent().connect("player_limit_right", set_limit_right)
	get_parent().connect("player_limit_bottom", set_limit_bottom)
	get_parent().connect("player_clear_score", points_clear)
	score_label.set_text(var_to_str(0))
	if DataPassthrough.player_pos_x:
		position.x = DataPassthrough.player_pos_x
		position.y = DataPassthrough.player_pos_y

func _physics_process(delta: float) -> void:
	if grav_disable == false:
		velocity.y += gravity * delta
	move_and_slide()
	
	if Input.is_action_just_pressed("pause") and get_meta("disabled") == false:
		var lvl = HUB_1.instantiate()
		get_parent().call("clear_rooms") #clears rooms
		#get_parent().call("disable_player", true) #disables player from moving
		GlobalSignals.emit_signal("move",145, 228)
		get_parent().emit_signal("player_clear_score")
		DataPassthrough.panic = false
		Globaltimer.stop()
		DataPassthrough.player_pos_x = 0
		DataPassthrough.player_pos_y = 0
		get_parent().add_child(lvl)
		#await lvl.ready
		#get_parent().call()

func afterimage_stop():
	afterimagetimer.stop()

func afterimage_add():
	afterimagetimer.start()
	var afterimagemach2 = SPRITE_AFTERIMAGE.instantiate()
	afterimagemach2.set_spriteframes(sprite.sprite_frames)
	afterimagemach2.set_sprite_flip(sprite.flip_h)
	afterimagemach2.set_animation_and_frames(sprite.animation, sprite.frame)
	afterimagemach2.set_sprite_gpos(position)
	afterimagemach2.set_sprite_offset(sprite.position.x, sprite.position.y)
	get_parent().add_child(afterimagemach2)

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
	score_label.set_text(var_to_str(score))

func _change_dir(dir: int) -> void:
	player_data.player_direction = dir

func player_enabled() -> void:
	show()

func player_disabled() -> void:
	hide()

func _get_pos_x() -> int:
	return position.x

func _get_pos_y() -> int:
	return position.y

func change_state(change: String, _f_dir: int) -> void:
	state_override_change = change
	force_direction = _f_dir
	state_override = true

func save_data():
	var saved_score = Jsonsaveloading.load_level_data(level_name)
	if score > saved_score:
		Jsonsaveloading.save_level_data(level_name, score)
	

func get_level_name(name: String) -> void:
	level_name = name


func _on_afterimagetimer_timeout() -> void:
	afterimage_add()
