##signals for players and rooms
extends Node

signal hide(room_id: int)
signal show(room_id: int)
signal remove(room_id: int)
signal room_id_send
signal send_score(score: int)

#for player only
signal move(x: int, y: int)
signal add_score (points: int)
signal change_state(state: String, _extra: int)
