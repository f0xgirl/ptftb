extends CanvasModulate

@onready var canvas_modulate: CanvasModulate = $"."



func _process(_delta: float) -> void:
	if DataPassthrough.panic == true:
		canvas_modulate.color.v
