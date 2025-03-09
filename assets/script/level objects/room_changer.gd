extends Area2D
@export_category("Location")
##id of current room
@export var room_id: int
##put method name in parent script to load said room
@export var load_room: String
##id of room to change to
@export var next_room_id: int
@export_category("Player Postion")
@export var X: int
@export var Y: int


func _on_body_entered(body: Node2D) -> void:
	Audioplayer._play_sfx_switchingrooms()
	if body.is_in_group("player"):
		GlobalSignals.emit_signal("move", X, Y)
		get_parent().get_parent().call(load_room, next_room_id, room_id)
		
		


func _hidden() -> void:
	hide()
	monitoring = false


func _visible() -> void:
	monitoring = true
	show()
