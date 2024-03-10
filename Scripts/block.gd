extends Node2D
class_name Block

signal on_destroy(position: Vector2)
signal on_dropped

@export var sound_destroy: AudioStreamPlayer

func _ready():
	var color = randi_range(0, 4)
	$StaticBody2D/Sprite2D.frame = color


func drop():
	on_dropped.emit()

func destroy():
	on_destroy.emit(position)
	sound_destroy.play()
	queue_free()

func on_entered(area: Area2D):
	if area is BallArea:
		destroy()
