extends Node2D
class_name Toppin

@onready var player: peppino = get_parent().get_child(0) #you know maybe this isnt the best way to get the player but who gaf
@export var sprite: AnimatedSprite2D

var player_pos
var target_pos

func _physics_process(delta: float) -> void:
	player_pos = player.position
	target_pos = (player_pos - position ).normalized()
    position += target_pos * speed * delta #TODO: Add offsets & make them rubberband