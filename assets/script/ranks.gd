extends room

@export var level_req: level_rank_req
@onready var rankmusic: AudioStreamPlayer2D = %rankmusic
var player: peppino = get_parent().get_child(0)

const RANKD = preload("res://AUDIO/mu_rankd.wav")
const RANKC = preload("res://AUDIO/mu_rankc.wav")
const RANKB = preload("res://AUDIO/mu_rankb.wav")
const RANKA = preload("res://AUDIO/mu_ranka.wav")
const RANKS = preload("res://AUDIO/mu_ranks.wav")

func give_rank_req(thing: level_rank_req):
	level_req = thing

func _on_tree_entered() -> void:
	match player.score:
		level_req.rank_d:
			pass
		level_req.rank_c:
			pass
		level_req.rank_b:
			pass
		level_req.rank_a:
			pass
		level_req.rank_s:
			pass
