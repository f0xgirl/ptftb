extends AudioStreamPlayer

const music_placeholder = preload("res://AUDIO/placeholder2.mp3")
const pillar_impact = preload("res://AUDIO/JOHN_PILLAR_IMPACT.wav")
const hub = preload("res://AUDIO/mu_hub.wav")
const pizzatime = preload("res://AUDIO/mu_pizzatime.wav")
const SFX_MACH_1 = preload("res://AUDIO/sfx_mach1.wav")
const SFX_MACH_2 = preload("res://AUDIO/sfx_mach2.wav")
const SFX_MACH_3 = preload("res://AUDIO/sfx_mach3.wav")
const SFX_MACH_4 = preload("res://AUDIO/sfx_mach4.wav")
const SFX_DOOR = preload("res://AUDIO/sfx_door.wav")

func _play_music(music: AudioStream, volume = 0.0):
	if stream == music:
		return
		
	stream = music
	volume_db = volume
	play()
func _play_music_placeholder():
	_play_music(music_placeholder)

func _play_music_hub():
	_play_music(hub)

func _play_music_pizzatime():
	_play_music(pizzatime)
	

func _play_sfx(stream: AudioStream, volume = 0.0):
	var fx_player = AudioStreamPlayer.new()
	fx_player.stream = stream
	fx_player.name = "FX_PLAYER"
	fx_player.volume_db = volume
	add_child(fx_player)
	fx_player.play()
	
	await fx_player.finished
	
	fx_player.queue_free()
	
func _play_sfx_pillar_impact():
	_play_sfx(pillar_impact)

func _play_sfx_mach1():
	_play_sfx(SFX_MACH_1)

func _play_sfx_mach2():
	_play_sfx(SFX_MACH_2)

func _play_sfx_mach3():
	_play_sfx(SFX_MACH_3)

func _play_sfx_switchingrooms():
	_play_sfx(SFX_DOOR)