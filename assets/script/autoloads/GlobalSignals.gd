##signals for players and rooms
extends Node

signal hide(room_id: int)
signal show(room_id: int)
signal remove(room_id: int)
signal room_id_send

#for player only
signal move(x: int, y: int)
signal add_score (points: int)
