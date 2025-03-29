extends state_changer
## Gives player rocketpep transformation
class_name rocket

## 1 = right,[br]
##-1 = left.
@export_range(-1, 1) var forced_direction: int

func _on_body_entered(body: Node2D) -> void:
	pass
	
