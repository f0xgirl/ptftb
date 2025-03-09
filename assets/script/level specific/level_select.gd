extends room

var disabled: bool = false
var selected_room: int = 0

func _ready() -> void:
	print("working!")
	Audioplayer._play_music_hub()
	

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("up"):
		selected_room -=1
	elif Input.is_action_just_pressed("down"):
		selected_room +=1
	if Input.is_action_just_pressed("action1"):
		print("working!")
		get_parent().call("room_called", selected_room)
		queue_free()
