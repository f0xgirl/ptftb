extends AudioStreamPlayer

const music_placeholder = preload("res://AUDIO/placeholder.mp3")
const PIZZAFACE_LAUGH = preload("res://AUDIO/sound effects/PizzafaceLaugh2.wav")
const pillar_impact = preload("res://AUDIO/sound effects/JOHN_PILLAR_IMPACT.wav")
const hub = preload("res://AUDIO/mu_hub.wav")
const pizzatime = preload("res://AUDIO/mu_pizzatime.wav")
const pinball = preload("res://AUDIO/music/pinball.mp3")
const john = preload("res://AUDIO/unearthly.mp3")
const SUGAR = preload("res://AUDIO/sugar.mp3")
const VIR = preload("res://AUDIO/vir.mp3")
const SCARY = preload("res://AUDIO/music_scary.ogg")
const SFX_MACH_1 = preload("res://AUDIO/sfx_mach1.wav")
const SFX_MACH_2 = preload("res://AUDIO/sfx_mach2.wav")
const SFX_MACH_3 = preload("res://AUDIO/sfx_mach3.wav")
const SFX_MACH_4 = preload("res://AUDIO/sfx_mach4.wav")
const SFX_DOOR = preload("res://AUDIO/sound effects/sfx_door.wav")
const SFX_COLLECT = preload("res://AUDIO/sound effects/sfx_collect.wav")
const SFX_COLLECTGIANTPIZZA = preload("res://AUDIO/sound effects/sfx_collectgiantpizza.wav")
const SFX_COLLECTPIZZA = preload("res://AUDIO/sound effects/sfx_collectpizza.wav")
const SFX_COLLECTTOPPIN = preload("res://AUDIO/sound effects/sfx_collecttoppin.wav")
const SFX_ESCAPESPAWN = preload("res://AUDIO/sfx_escapespawn.wav")
const SFX_BREAKMETAL = preload("res://AUDIO/sound effects/sfx_breakmetal.wav")
const SFX_DETRANSFO = preload("res://AUDIO/sound effects/Detransfo.wav")
const SFX_BREAKBLOCK1 = preload("res://AUDIO/sound effects/sfx_breakblock1.wav")
const SFX_BREAKBLOCK2 = preload("res://AUDIO/sound effects/sfx_breakblock2.wav")

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

func _play_music_pinball():
	_play_music(pinball)
	
func _play_music_jg():
	_play_music(john)

func _play_music_sugar():
	_play_music(SUGAR)

func _play_music_vir(volume: float):
	_play_music(VIR, volume)

func _play_music_scary():
	_play_music(SCARY)

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

func _play_sfx_toppinget_small():
	_play_sfx(SFX_COLLECT)

func _play_sfx_toppinget_big():
	_play_sfx(SFX_COLLECTPIZZA)

func _play_sfx_pizzalaugh():
	_play_sfx(PIZZAFACE_LAUGH)
	
func _play_sfx_breakmetal():
	_play_sfx(SFX_BREAKMETAL)

func _play_sfx_detransfo():
	_play_sfx(SFX_DETRANSFO)

func _play_sfx_breaksmall():
	_play_sfx(SFX_BREAKBLOCK1)

func _play_sfx_breakbig():
	_play_sfx(SFX_BREAKBLOCK2)
