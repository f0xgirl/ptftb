extends Node2D

@export var data_player: player_data
@onready var camera: Camera2D = $Camera2D

func _onready():
	pass

func _process(delta: float) -> void:
	
	if Input.is_action_just_pressed("down"):
		
		camera.set_limit(SIDE_BOTTOM, data_player.change_limit(100)) 
		
	
	
	
	
	if Input.is_action_just_pressed("action2"):
		get_tree().change_scene_to_file("res://assets/scenes/title.tscn")
