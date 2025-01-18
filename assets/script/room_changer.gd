extends Area2D
var room
@export_category("Location")
@export var room_id: int
@export var parent: Node
@export_dir var location
@export var nextroom: PackedScene
@export_category("Player Postion")
@export var X: int
@export var Y: int


func _on_body_entered(body: Node2D) -> void:
	Audioplayer._play_sfx_switchingrooms()
	if body.is_in_group("player"):
		Globalsignal.changeroom.emit(nextroom)
		parent.delete.emit()
