extends CharacterBody2D
class_name peppino

@export var player_data: player_data
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@export var jump_velocity: int
@onready var camera: Camera2D = $Camera2D
@export var level_data: level_data
@onready var score: Label = $score/Control/MarginContainer/HBoxContainer/VBoxContainer/Label
@onready var sprite: AnimatedSprite2D = $sprite
var state: State
var state_override: bool = false
var state_override_change: String
var in_ladder: bool = false
var still_in_ladder: bool = false


func _ready():
	Globalsignal.playergoto.connect(playergoto)
	Globalsignal.changecam.connect(setcamboundaries)

func _physics_process(delta: float) -> void:
	if in_ladder == false:
		velocity.y += gravity * delta
	move_and_slide()
	if Input.is_action_just_pressed("pause"):
		get_tree().change_scene_to_file("res://assets/scenes/level_select.tscn")

func playergoto(xy):
	print("hi")
	print(xy)
	set_global_position(xy)
	

func setcamboundaries(boundaires: level_data):
	print("hi")
	camera.limit_left = boundaires.get_limit(0)
	camera.limit_top = boundaires.get_limit(1)
	camera.limit_right = boundaires.get_limit(2)
	camera.limit_bottom = boundaires.get_limit(3)
func in_ladder_or_not(ladder: bool):
	in_ladder = ladder
func ladder_stop():
	velocity.y += gravity

func change_state(trans: String):
	pass


func _on_hot_sauce_body_entered(body: Node2D) -> void:
	state_override = true
	state_override_change = "player_fireass"
