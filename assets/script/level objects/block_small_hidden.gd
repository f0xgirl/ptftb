extends block_small
class_name block_small_hidden

const PLACEHOLDER_SPRITE = preload("res://resources/placeholdertilesetcropped.tres")

enum block {
    placeholder_no_side = 0,
    placeholder_left_side = 1,
    placeholder_bottom = 2,
    placeholder_right_side = 3,
    placeholder_top = 4,
    placeholder_top_right = 5,
    placeholder_top_left = 6,
    placeholder_bottom_left = 7,
    placeholder_bottom_right = 8,
}

@export var tile: block

func _ready() -> void:
	get_parent().get_parent().connect("hidden", _hidden)
	get_parent().get_parent().connect("visible", _visible)
	place_tile()







func place_tile():
	match tile:
		0:
			sprite.texture = PLACEHOLDER_SPRITE
			sprite.set_region_rect(Rect2i(96,80,32,32))
		
		1:
			pass
