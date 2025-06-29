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
	
	var value: int
	match level_name:
		"tutorial":
			value = saved_data["tutorial"]
		"john gutter":
			value = saved_data["john gutter"]
		"mid":
			value = saved_data["mid"]
	return value

func tutorial_complete() -> void:
	var file = FileAccess.open("user://pftb.json", FileAccess.WRITE)

	saved_data["tutorial_completed"] = true

	var json = JSON.stringify(saved_data)

	file.store_string(json)
	file.close()

func check_if_tutorial_completed() -> bool:
	var file = FileAccess.open("user://ptftb.json", FileAccess.READ)
	var json = file.get_as_text()

	saved_data = JSON.parse_string(json)

	print("hi")
	if saved_data["tutorial_completed"] == true:
		print("thing 1")
		return true
	else:
		print("thing 2")
		return false
	
