extends CharacterBody2D
class_name peppino

@export var player_data: player_data
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@export var jump_velocity: int
@onready var camera: Camera2D = $Camera2D
@export var level_data: level_data
var state: State
var state_override: bool = false
var state_override_change: String
var in_ladder: bool = false
var still_in_ladder: bool = false

func _ready():
	
	setcamboundaries()
	if DataPassthrough.player_pos_x:
		position.x = DataPassthrough.player_pos_x
		position.y = DataPassthrough.player_pos_y

func _physics_process(delta: float) -> void:
	if in_ladder == false:
		velocity.y += gravity * delta
	move_and_slide()

func setcamboundaries():
	camera.limit_left = level_data.get_limit(0)
	camera.limit_top = level_data.get_limit(1)
	camera.limit_right = level_data.get_limit(2)
	camera.limit_bottom = level_data.get_limit(3)
func in_ladder_or_not(ladder: bool):
	in_ladder = ladder
func ladder_stop():
	velocity.y += gravity

func change_state(trans: String):
	pass


func _on_hot_sauce_body_entered(body: Node2D) -> void:
	state_override = true
	state_override_change = "player_fireass"
