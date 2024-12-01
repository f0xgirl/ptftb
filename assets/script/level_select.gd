extends Node

@export var levels: Array [level_info]
@onready var label: Label = $Label

func _ready() -> void:
	label.text = levels[0].level_name

func _process(delta: float) -> void:
	pass
