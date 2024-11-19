extends Resource
class_name player_data

var player_direction: int
@export var speed: int
@export var crawling_speed: int
@export var mach1_speed: int
@export var mach2_speed: int
@export var mach3_speed: int
@export var jumpheight: int
var player_pos: Vector2i

# changes player postion, do not use to change anything else with Vector2i variable
func change_pos(x: int, y: int):
	player_pos = Vector2i(x, y)
	return player_pos
	
