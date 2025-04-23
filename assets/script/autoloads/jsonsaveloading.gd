extends Node
class_name json_save_loader

var saved_data: Dictionary

func save_level_data(level_name: String, score: int) -> void:
	var file = FileAccess.open("user://pftb.json", FileAccess.WRITE)
	
	saved_data[level_name] = score
	
	var json = JSON.stringify(saved_data)
	
	file.store_string(json)
	file.close()

func load_level_data(level_name: String) -> int:
	var file = FileAccess.open("user://pftb.json", FileAccess.READ)
	var json = file.get_as_text()
	#print(json)
	saved_data = JSON.parse_string(json)
	
	#this can and will throw errors at you every chance it gets figure it out
	#i dont know what to tell you
	#(what its accessing probably doesnt exist check AppData)
	var value: int
	match level_name:
		"tutorial":
			value = saved_data["tutorial"]
		"john gutter":
			value = saved_data["john gutter"]
	return value
