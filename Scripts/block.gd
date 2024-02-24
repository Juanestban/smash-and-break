extends Node2D
class_name Block

signal on_destroy
signal on_dropped

func _ready():
	var color = randi_range(0, 4)
	$StaticBody2D/Sprite2D.frame = color

func destroy():
	queue_free()
