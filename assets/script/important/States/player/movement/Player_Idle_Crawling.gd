extends State_player
class_name Player_Crawling

@export var player: CharacterBody2D
@export var player_data: player_data
@export var sprite: AnimatedSprite2D
var direction = Input.get_axis("left","right")

func Enter():
	DataPassthrough.player_state = "Player_Crawling"

func Update(_delta: float):
	if player.is_on_floor():
		sprite.play("crawling")
	if Input.is_action_just_pressed("action1") and player.is_on_floor():
		sprite.play("crawling_jump")
		player.velocity.y = player_data.jumpheight
	if player.is_on_floor() == false:
		if sprite.animation == "crawling_jump":
			await sprite.animation_finished
			sprite.play("crawling air")
	else:
		if sprite.animation == "crawling_jump":
			await sprite.animation_finished
			sprite.play("crawling air")
			sprite.play("crawling")
			emit_signal("anim_offset",2,10)
	direction = Input.get_axis("left","right")
	sprite_flip()
	if direction == 0:
		Transitioned.emit(self,"player_idle_crouched")
	if direction != 0:
		player_data.player_direction = direction
	if player.state_override == true:
		player.state_override = false
		Transitioned.emit(self,player.state_override_change)


func Pyhsics_Update(_delta: float):
	player.velocity.x = direction * player_data.crawling_speed
		

func sprite_flip():
	if player_data.player_direction == 1:
		sprite.offset.x = 0
		sprite.flip_h = false
	else:
		sprite.offset.x = -8
		sprite.flip_h = true
