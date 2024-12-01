extends Node

@export var levels: Array [level_info]
@onready var label: Label = $CanvasLayer/Control/MarginContainer/HBoxContainer/VBoxContainer/Label

var level_title: String

func _ready() -> void:
	#level_title = 
	label.set_text(levels[0].level_name)

func _process(delta: float) -> void:
	pass
