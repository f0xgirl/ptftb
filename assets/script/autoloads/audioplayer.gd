extends AudioStreamPlayer

const music_placeholder = preload("res://AUDIO/placeholder2.mp3")

func _play_music(music: AudioStream, volume = 0.0):
	if stream == music:
		return
		
	stream = music
	volume_db = volume
	play()
func _play_music_placeholder():
	_play_music(music_placeholder)
