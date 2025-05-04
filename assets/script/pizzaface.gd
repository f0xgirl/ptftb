extends Node2D

@onready var player: peppino = get_parent().get_child(0)
@onready var spawn_in: Timer = $"spawn"

var can_move: bool = false
var player_pos
var target_pos 
@export var speed: int

func _ready() -> void:
	position = player.position
	GlobalSignals.connect("move", set_pos)
	spawn_in.start()


func _physics_process(delta: float) -> void:
	player_pos = player.position
	target_pos = (player_pos - position ).normalized()
	if can_move == true:
		position += target_pos * speed * delta

func set_pos(x: int, y: int) -> void:
	can_move = false
	global_position.x = x
	global_position.y = y
	spawn_in.start()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		print("caught")


func _on_spawn_timeout() -> void:
	print("timeout")
	can_move = true
	
