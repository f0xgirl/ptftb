extends Area2D
@export_category("Location")
@export var room_id: int
@export_category("Player Postion")
@export var X: int
@export var Y: int


func _on_body_entered(body: Node2D) -> void:
	Audioplayer._play_sfx_switchingrooms()
	if body.is_in_group("player"):
		GlobalSignals.emit_signal("hide", room_id)
		GlobalSignals.emit_signal("move", X, Y)
		get_parent().get_parent().call("load_room_test", 1)
		
		


func _hidden() -> void:
	hide()


func _visible() -> void:
	show()
