extends Node

var player = preload("res://assets/scenes/player.tscn")

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("action2"):
		get_tree().change_scene_to_file("res://assets/scenes/levels/baselevel.tscn")
		
		music()


func _on_video_stream_player_finished() -> void:
	get_tree().change_scene_to_file("res://assets/scenes/levels/baselevel.tscn")
	music()

func music():
	#Audioplayer._play_music_placeholder()
	pass
