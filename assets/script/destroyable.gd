extends RayCast2D

var blocks: basic_block

func _process(_delta: float) -> void:
	if get_collider() is metal_block:
		print("metal block")
