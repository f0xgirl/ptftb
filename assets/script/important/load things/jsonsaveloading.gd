extends Node
class_name json_save_loader

@onready var player: peppino = $"../player"



func save_level_data(level_name: String, score: int) -> void:
	var file = FileAccess.open("user://pftb.json", FileAccess.READ_WRITE)
	var saved_data = {}
	
	var temp_json = file.get_as_text()
	
	saved_data = JSON.parse_string(temp_json)
	
	
	#if not saved_data["level"] == level_name:
	#	pass
	#saved_data["score"] = score
	#saved_data["level"] = level_name
	
	var json = JSON.stringify(saved_data)
	
	file.store_string(json)
	file.close()

func load_level_data() -> void:
	var file = FileAccess.open("user://pftb.json", FileAccess.READ)
	 
	var json = file.get_as_text()
	
	var saved_data = JSON.parse_string(json)
	
