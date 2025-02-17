extends AnimatedSprite2D
#TODO: connect signals, probably have them in global signals or something idk maybe i can have them in here

#whether or not animations can override another one freely i.e falling when walking
var override: bool = true
var loop: bool = true

#changes override variable
func _anim_override(change: bool) -> void:
	override = change

##overridable = false cannot be changed and will be said animation until specific input
##
##overridable = true can be overrided at any time
func _anim_change(anim: String, overridable: bool) -> void:
	if override != overridable:
		play(anim)

#offsets animation, id rather not use this at all but i have to unfortunately
func _anim_offset(x: int, y: int) -> void:
	position.x = x
	position.y = y

#
func _anim_loop(loopable: bool) -> void:
	loop = loopable
