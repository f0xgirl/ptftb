extends CharacterBody2D

@export var player_data: player_data
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@export var jump_velocity: int
@onready var camera: Camera2D = $Camera2D
@export var level_data: level_data

func _ready():
	setcamboundaries()
	

func _physics_process(delta: float) -> void:
	velocity.y += gravity * delta
	move_and_slide()

func setcamboundaries():
	camera.limit_left = level_data.get_limit(0)
	camera.limit_top = level_data.get_limit(1)
	camera.limit_right = level_data.get_limit(2)
	camera.limit_bottom = level_data.get_limit(3)
