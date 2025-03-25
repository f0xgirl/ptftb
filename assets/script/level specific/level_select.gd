extends room
class_name level_select

var disabled: bool = false
var selected_room: int = 0
@export var level_list: Array [String]
@onready var label: Label = %Label

func _ready() -> void:
	Audioplayer._play_music_hub()
	

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("up"):
		selected_room -=1
		_refresh_label(selected_room)
	elif Input.is_action_just_pressed("down"):
		selected_room +=1
		_refresh_label(selected_room)
	if Input.is_action_just_pressed("action1"):
		get_parent().call("room_called", selected_room)
		get_parent().call("disable_player", false)
		queue_free()

func _refresh_label(index: int) -> void:
	label.text =  level_list[index]
