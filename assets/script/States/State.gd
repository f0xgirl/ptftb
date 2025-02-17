extends Node
## Generic state machine, used to be extended off of.
class_name State

## Emitted when state calls for the state to be changed.
signal Transitioned

## The first function to be called when a state in activated.
func Enter():
	pass
## Called when Transitioned is emitted.
func Exit():
	pass
## Basically is just _process from any regular node.
func Update(_delta: float):
	pass
## Basically is just _pyhsics_process from any regular node.
func Pyhsics_Update(_delta: float):
	pass
