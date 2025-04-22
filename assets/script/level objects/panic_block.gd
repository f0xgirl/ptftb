@icon("res://assets/sprites/spr_enemyblockdead_0.png")
extends Sprite2D
class_name panic_block

## reverses the wether it should show or not
@export var reversed: bool = false
@onready var animation_tree: AnimationTree = $AnimationTree
@onready var staticbod: StaticBody2D = $StaticBody2D

func _ready() -> void:
	animation_tree.set("parameters/blend_position", 1)
	get_parent().connect("hidden", _hidden)
	get_parent().connect("visible", _visible)
	get_parent().connect("panic", _panic)
	if reversed == true:
		staticbod.set_collision_layer_value(1, true)
		animation_tree.set("parameters/blend_position", 1)
	else:
		staticbod.set_collision_layer_value(1, false)
		animation_tree.set("parameters/blend_position", -1)

func _hidden() -> void:
	staticbod.set_collision_layer_value(1, false)
	hide()


func _visible() -> void:
	show()
	if DataPassthrough.panic == false and reversed == false:
		staticbod.set_collision_layer_value(1, false)
		animation_tree.set("parameters/blend_position", -1) 
	if DataPassthrough.panic == true and reversed == false:
		staticbod.set_collision_layer_value(1, true)
		animation_tree.set("parameters/blend_position", 1)
	if DataPassthrough.panic == false and reversed == true:
		staticbod.set_collision_layer_value(1, true)
		animation_tree.set("parameters/blend_position", -1)
	if DataPassthrough.panic == true and reversed == true:
		staticbod.set_collision_layer_value(1, false)
		animation_tree.set("parameters/blend_position", -1)

func _panic() -> void:
	_visible()
	


func _id(id: int):
	print("room_id: " + var_to_str(id))
	#obj_id = id

func _check_panic() -> bool:
	if DataPassthrough.panic == true:
		return true
	else:
		return false
