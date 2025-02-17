extends State
## State machine specifically for the player, do not use this for any else i swear to god.
class_name State_player

##Changes animation.[br][br]
##
##overridable = false: cannot be changed and will be said animation until specific input.[br]
##overridable = true: can be overrided at any time.
signal anim_change(anim: String, overridable: bool)
##Signal for changing the override variable in player_animation.gd
signal anim_override(change: bool)
##Offsets animation.
signal anim_offset(x: int, y: int)
##Signal for if the animation is to be looped or not.[br]
##(sidenote: im not sure if this will be depricated or not soooo yeah)
signal anim_loop(loopable: bool)
