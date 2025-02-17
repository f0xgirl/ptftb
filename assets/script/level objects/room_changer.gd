extends Area2D
@export_category("Location")
@export var room_id: int
@export_dir var location
@export_category("Player Postion")
@export var X: int
@export var Y: int


func _on_body_entered(body: Node2D) -> void:
	Audioplayer._play_sfx_switchingrooms()
	if body.is_in_group("player"):
		get_tree().change_scene_to_file(location)
		DataPassthrough.keep_state = true
		DataPassthrough.player_pos_x = X
		DataPassthrough.player_pos_y = Y
		save(room_id)
		
		

func save(id):
	var packed_scene = PackedScene.new()
	packed_scene.pack(get_node(get_path()))
	ResourceSaver.save(packed_scene, "res://save" + str(id) + ".tscn")
func load(id):
	get_tree().change_scene("res://save" + str(id) + ".tscn")
