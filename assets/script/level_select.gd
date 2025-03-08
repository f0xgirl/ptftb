extends Node
# DEPRICATED DO NOT ATTACH
@export var levels: Array [level_info]
@onready var label: Label = $CanvasLayer/Control/MarginContainer/HBoxContainer/VBoxContainer/Label
var current: int = 0


var level_title: String

func _ready() -> void:
	Audioplayer._play_music_hub()
	draw_label()

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("up"):
		if current < 0:
			current = 0
		else:
			current -= 1
	if Input.is_action_just_pressed("down"):
		current += 1
	if Input.is_action_just_pressed("action1"):
		get_tree().change_scene_to_file(levels[current].file_path)
	draw_label()
	
func draw_label():
	if levels[current].level_name == null:
		current = 0
	label.set_text(levels[current].level_name)
