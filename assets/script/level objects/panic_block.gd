@icon("res://assets/sprites/spr_enemyblockdead_0.png")
extends Sprite2D
class_name panic_block

## reverses the wether it should show or not
@export var reversed: bool
@onready var staticbod: StaticBody2D = $StaticBody2D
var obj_id: int

func _ready() -> void:
	_hidden()	#get_parent().connect("send", _id)
	#get_parent().connect("hidden", _hidden)
	#get_parent().connect("visible", _visible)
	#get_parent().connect("panic", _panic)
	#if reversed == true:
	#	_visible()
	#else:
	#	_hidden()


func _hidden() -> void:
	staticbod.set_collision_layer_value(1, false)
	hide()


func _visible() -> void:
	staticbod.set_collision_layer_value(1, true)
	show()

func _panic() -> void:
	if reversed == true:
		_hidden()
	else:
		_visible()
	

func _id(id: int):
	print("room_id: " + var_to_str(id))
	obj_id = id

func _check_panic() -> bool:
	if DataPassthrough.panic == true:
		return true
	else:
		return false
