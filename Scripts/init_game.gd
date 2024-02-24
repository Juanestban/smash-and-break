extends Node2D
class_name InitGame

# Called when the node enters the scene tree for the first time.
func _ready():
	for x in range(20):
		var block = preload("res://Entities/block.tscn")
		var instance_block = block.instantiate()
	
		add_child(instance_block)
