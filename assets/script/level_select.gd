extends Node

@export var levels: Array [level_info]
@onready var label: Label = $CanvasLayer/Control/MarginContainer/HBoxContainer/VBoxContainer/Label
var current: int = 0
const JG = preload("res://assets/scenes/levels/john gutter/john_gutter_1.tscn")

var level_title: String

func _ready() -> void:
	
	Audioplayer._play_music_hub()
	draw_label()
	

func _process(delta: float) -> void:
	currentchange()
	if Input.is_action_just_pressed("up"):
		if current < 0:
			current = 0
		else:
			current -= 1
	if Input.is_action_just_pressed("down"):
		current += 1
	if Input.is_action_just_pressed("action1"):
		Globalsignal.changeroom.emit()
		queue_free()
		
	draw_label()
	
func draw_label():
	if levels[current].level_name == null:
		current = 0
	label.set_text(levels[current].level_name)

func currentchange():
	pass
	#current_level = levels[current].file_path
