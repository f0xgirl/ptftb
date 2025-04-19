extends State_player
class_name Player_groundpound

@export var sprite: AnimatedSprite2D 
@export var player: CharacterBody2D
@onready var plane: AudioStreamPlayer2D = %plane
@onready var supermove: AudioStreamPlayer2D = %supermove
signal velocitynone
var called: bool

func Enter():
	player.velocity.x = 0
	player.velocity.y = 0
	DataPassthrough.player_state = "player_groundpound"
	player.velocity.y = -250
	godown()
	plane.play()
	sprite.call("_animation_play_groundpound")

func Update(_delta: float):
	if player.velocity.y > 0:
		emit_signal("velocitynone")
		sprite.call("_animation_play_freefall")
	if player.is_on_floor():
		alreadycalled() #used to play _animation_freefall_landed
		plane.stop()
		await sprite.animation_finished
		var stun = Timer.new()
		get_parent().get_parent().add_child(stun)
		stun.start(0.1)
		await stun.timeout
		Transitioned.emit(self,"Player_idle")
		stun.queue_free()
		

func godown():
	print("go down")
	await velocitynone
	print("")
	player.velocity.y = 500

func alreadycalled():
	if called == true:
		pass
	else:
		sprite.call("_animation_play_freefall_landed")
		called = true
	
func Exit():
	called = false
