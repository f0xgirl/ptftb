extends Node

@export var Inital_state : State

var current_state : State
var states: Dictionary = {}

func _ready():
	for child in get_children():
		if child is State:
			states[child.name.to_lower()] = child
			child.Transitioned.connect(on_child_transition)
	if Inital_state:
		Inital_state.Enter()
		current_state = Inital_state

func _process(delta: float) -> void:
	if current_state:
		current_state.Update(delta)
	
func _physics_process(delta: float) -> void:
	if current_state:
		current_state.Pyhsics_Update(delta)

func on_child_transition(state, new_state_name):
	if state != current_state:
		return
	
	var new_state = states.get(new_state_name.to_lower())
	if !new_state:
		return
	
	if current_state:
		current_state.Exit()
	
	new_state.Enter()
	
	current_state = new_state
