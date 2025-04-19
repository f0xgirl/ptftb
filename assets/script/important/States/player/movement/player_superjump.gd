extends State_player
class_name Player_Superjump

@export var sprite: AnimatedSprite2D 
@export var player: CharacterBody2D
@onready var plane: AudioStreamPlayer2D = %plane
@onready var supermove: AudioStreamPlayer2D = %supermove
var stopforasec: bool = true

func Enter():
	sprite.play("superjump_prep")
	supermove.play()
	player.velocity.y = -250
	player.velocity.x = 0
	await sprite.animation_finished
	sprite.play("superjump")
	plane.play()
	DataPassthrough.player_state = "Player_Superjump"

func Update(_delta: float):
	if player.velocity.y > 100:
		stopforasec = false
	if stopforasec == false:
		player.velocity.y += -100
	if player.is_on_ceiling():
		Transitioned.emit(self,"Player_idle")
		plane.stop()
	if player.state_override == true and check_disabled() == false:
		player.state_override = false
		print(player.state_override_change)
		Transitioned.emit(self,player.state_override_change)

func Exit() -> void:
	stopforasec = true


func check_disabled() -> bool:
	if player.get_meta("disabled") == true:
		return true
	else:
		return false
