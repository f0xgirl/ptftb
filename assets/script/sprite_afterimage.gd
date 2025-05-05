extends AnimatedSprite2D
class_name afterimage

func set_spriteframes(sprite):
	sprite_frames = sprite
	
func set_sprite_offset(x: int, y:int ) ->void:
	offset.x = x
	offset.y = y

func afterimage() -> void:
	var disappear = get_tree().create_timer(0.15)
	queue_free()
	print("gone")

func set_animation_and_frames(anim: String, frame_value: int) -> void:
	animation = anim
	frame = frame_value

func set_sprite_flip(flip: bool):
	flip_h = flip

func set_sprite_gpos(gposition: Vector2):
	position = gposition

func _on_timer_timeout() -> void:
	queue_free()
