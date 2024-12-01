extends AnimatedSprite2D

@export var enterexit: bool
@export_dir var location
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
		


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		enter = true
		print("true")
	

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		enter = false
		print("false")
