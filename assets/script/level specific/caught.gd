extends room

@onready var timer: Timer = $Timer
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D

func _on_tree_entered() -> void:
	get_parent().call("disable_player")
	Audioplayer.stop()
	pass #TODO add graphics and state for player


func _on_finished() -> void:
	get_parent().call("enable_player")
	get_parent().call("clear_rooms")
	get_parent().call("load_hub1",0,0)
