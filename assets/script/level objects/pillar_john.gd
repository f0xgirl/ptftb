extends Area2D

@onready var john: AnimatedSprite2D = $".."

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player") and DataPassthrough.player_state == "player_mach2" or DataPassthrough.player_state == "player_mach3":
		DataPassthrough.panic = true
		Audioplayer._play_music_pizzatime()
		Audioplayer._play_sfx_pillar_impact()
		Globaltimer.start(john.panic_time)
		john.queue_free()
		
