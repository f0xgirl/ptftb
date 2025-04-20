extends State_player
class_name Player_groundpound

@export var sprite: AnimatedSprite2D 
@export var player: CharacterBody2D
@onready var plane: AudioStreamPlayer2D = %plane
@onready var supermove: AudioStreamPlayer2D = %supermove
signal velocitynone
var called: bool
var destroy_metal: bool = false
var landed: bool = false

func Enter():
	player.velocity.x = 0
	player.velocity.y = 0
	DataPassthrough.player_state = "player_groundpound"
	player.velocity.y = -250
	godown()
	plane.play()
	sprite.call("_animation_play_groundpound")

func Update(_delta: float):
	if player.velocity.y > 0 and landed == false:
		emit_signal("velocitynone")
		sprite.call("_animation_play_freefall")
	if player.is_on_floor():
		for index in player.get_slide_collision_count():
			var collider = player.get_slide_collision(index).get_collider()
			print(collider)
			if collider.name.begins_with("block"):
				collider.queue_free()
				break
			else:
				landed = true
				if collider.name.begins_with("metal") and destroy_metal == true:
					player.grav_disable = true
					collider.queue_free()
				alreadycalled() #used to play _animation_freefall_landed
				plane.stop()
				await sprite.animation_finished
				player.grav_disable = false
				Transitioned.emit(self,"Player_idle")
	if player.velocity.y > 1000:
		destroy_metal = true

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
	destroy_metal = false
	landed = false


func _metal_block_destroy_insta(destroy: bool) -> void:
	destroy_metal = destroy
