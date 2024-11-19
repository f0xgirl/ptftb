extends CharacterBody2D

@export var player_data: player_data
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@export var jump_velocity: int
@onready var camera_2d: Camera2D = $Camera2D

func _ready():
	pass
	
func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	velocity.y += gravity * delta
	
	
	move_and_slide()
