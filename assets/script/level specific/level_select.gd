extends room
class_name level_select

var disabled: bool = false
var selected_room: int = 0
@export var level_list: Array [String]
@onready var label: Label = %Label

func _ready() -> void:
	_goto_hub()

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("up"):
		selected_room -=1
		_refresh_label(selected_room)
	elif Input.is_action_just_pressed("down"):
		selected_room +=1
		_refresh_label(selected_room)
	if Input.is_action_just_pressed("action1"):
		get_parent().call("room_called", selected_room) #put selected room in second argument after
		get_parent().call("disable_player", false)
		queue_free()

func _refresh_label(index: int) -> void:
	label.text =  level_list[index]

func _goto_level_select():
	GlobalSignals.emit_signal("move", 653, 450)
	Audioplayer._play_music_hub()
	get_parent().call("_player_camera_limit", left, top, right, bottom)
	_refresh_label(selected_room) #temporary, put selected_room after

func _goto_hub():
	match DataPassthrough.which_hub:
		1:
			get_parent().call("room_called", 9)
			queue_free()
		2:
			pass
		3:
			pass
		4:
			pass
		5:
			pass
	
