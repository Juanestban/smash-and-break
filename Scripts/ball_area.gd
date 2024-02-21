extends Area2D
class_name BallArea

signal _on_rebound(direction: StringName)

func rebound(direction: StringName):
	_on_rebound.emit(direction)
