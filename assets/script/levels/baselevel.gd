extends Node

@export var level: String
var player = preload("res://assets/scenes/player.tscn")
var hub = preload("res://assets/scenes/levels/hubs/hub_1.tscn")



func _ready() -> void:
	var instance = player.instantiate()
	var instance2 = hub.instantiate()
	add_child(instance2)
	add_child(instance)
	Globalsignal.player_changepos.emit()
	

func _process(delta: float) -> void:
	pass

func changeplayerpos():
	print(get_child(1))
	
