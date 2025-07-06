extends block_big
class_name block_big_hidden

const PLACEHOLDER_SPRITE = preload("res://resources/placeholdertilesetcropped.tres")

enum block {
    placeholder_noside = 0,
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
			sprite.set_region_rect(Rect2i(80,64,64,64))

