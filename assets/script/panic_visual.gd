extends Label



func _process(delta: float) -> void:
	if DataPassthrough.panic == true:
		show()
	set_text(var_to_str(Globaltimer.time_left))
