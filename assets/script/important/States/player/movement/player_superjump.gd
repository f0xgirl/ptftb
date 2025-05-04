extends State_player
class_name Player_Superjump

@export var sprite: AnimatedSprite2D 
@export var player: CharacterBody2D
@onready var plane: AudioStreamPlayer2D = %plane
@onready var supermove: AudioStreamPlayer2D = %supermove
var stopforasec: bool = true
var superjump_ready: bool = false

func Enter():
	sprite.play("superjump_prep")
	supermove.play()
	player.velocity.y = -250
	player.velocity.x = 0
	await sprite.animation_finished
	var superjump_ready = true
	sprite.play("superjump")
	plane.play()
	DataPassthrough.player_state = "Player_Superjump"

func Update(_delta: float):
	if player.velocity.y > 100 or player.is_on_floor():
		stopforasec = false
	
	if player.is_on_ceiling():
		for index in player.get_slide_collision_count():
			var collider = player.get_slide_collision(index).get_collider()
			print(collider)
			if collider.name.begins_with("block") or collider.name.begins_with("metal"):
				collider.queue_free()
				player.velocity.y = -10
			else:
				Transitioned.emit(self,"Player_idle")
				plane.stop()
	if stopforasec == false:
		player.velocity.y += -100
	if player.state_override == true and check_disabled() == false:
		player.state_override = false
		print(player.state_override_change)
		Transitioned.emit(self,player.state_override_change)

func Exit() -> void:
	sprite.animation_finished.emit()
	superjump_ready = false
	stopforasec = true


func check_disabled() -> bool:
	if player.get_meta("disabled") == true:
		return true
	else:
		return false
