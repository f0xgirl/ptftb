extends CanvasModulate

@onready var canvas_modulate: CanvasModulate = $"."



func _process(delta: float) -> void:
	if DataPassthrough.panic == true:
		canvas_modulate.color.v
