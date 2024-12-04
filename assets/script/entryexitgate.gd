extends AnimatedSprite2D

@export var enterexit: bool
@export_dir var location
@export_category("Player Postion")
@export var X: int
@export var Y: int
var enter = false

func _ready() -> void:
	if enterexit == true or DataPassthrough.panic == true:
		play("open")
	else:
		play("closed")
	if DataPassthrough.panic == true:
		enterexit = true

func _process(delta: float) -> void:
	
	if Input.is_action_just_pressed("up") and enter == true:
		print("hi")
		get_tree().change_scene_to_file(location)
		DataPassthrough.player_pos_x = X
		DataPassthrough.player_pos_y = Y
		DataPassthrough.panic = false
		


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		enter = true
		print("true")
	

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		enter = false
		print("false")
