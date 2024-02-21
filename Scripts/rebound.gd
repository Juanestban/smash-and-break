extends Area2D
class_name Rebound

# right | left | top | bottom
@export var direction: StringName = ""

func _ready():
	area_entered.connect(rebound)


func rebound(area: Area2D):
	if area is BallArea:
		(area as BallArea).rebound(direction)
