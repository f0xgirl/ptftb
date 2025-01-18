extends Node
class_name room
signal delete
signal disable
signal enable

@export var levels: Array [PackedScene]
@export var leveldata: level_data

func _ready() -> void:
	Globalsignal.changelevel.emit(levels)
	delete.connect(begone) #GTFO PREVIOUS ROOM!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	if DataPassthrough.panic == false:
		Audioplayer._play_music_jg()


func _on_tree_entered() -> void:
	Globalsignal.changecam.emit(leveldata)
	Globalsignal.playergoto.emit(Vector2(0,100))

func begone():
	disable.emit()
