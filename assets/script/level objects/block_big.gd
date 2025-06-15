@icon("res://assets/sprites/sprite387_0.png")
extends block_base
class_name block_big

func _process(_delta: float) -> void:
    if is_queued_for_deletion():
        var break_sfx = randi_range(1, 2)
        match break_sfx:
            1:
                Audioplayer._play_sfx_breaksmall()
            2:
                Audioplayer._play_sfx_breakbig()
        