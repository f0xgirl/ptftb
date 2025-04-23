extends Node
class_name json_save_loader



func save_level_data(level_name: String, score: int) -> void:
	var file = FileAccess.open("user://pftb.json", FileAccess.WRITE)
	var saved_data = {}
	
	saved_data[level_name+ " score: "] = score
	
	var json = JSON.stringify(saved_data)
	
	file.store_string(json)
	file.close()

func load_level_data(portal: gate_portal):
	var file = FileAccess.open("user://pftb.json", FileAccess.READ)
	 
	var json = file.get_as_text()
	
	var saved_data = JSON.parse_string(json)
	
	#portal.score_text = saved_data.
