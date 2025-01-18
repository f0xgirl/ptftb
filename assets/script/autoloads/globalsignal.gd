extends Node

signal changeroom(room: PackedScene) #changes room within level
signal changelevel(new_levels: Array [PackedScene]) #loads level
signal playergoto(xy: Vector2)
signal changecam(lvldata: level_data)
