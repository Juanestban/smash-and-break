extends Node2D
class_name InitGame

const WIDTH_BLOCK := 74
const HEIGHT_BLOCK := 20
@warning_ignore("integer_division")
const INITIAL_POSITION_X := (WIDTH_BLOCK / 2) + 20
const INITIAL_POSITION_Y := 74

@onready var sound_destroy := AudioStreamPlayer.new()

func _ready():
	sound_destroy.stream = preload('res://Sounds/destroy.ogg')
	add_child(sound_destroy)

	for y in range(7):
		for x in range(15):
			var preblock = preload("res://Entities/block.tscn")
			var block: Block = preblock.instantiate()
			block.position.x = (WIDTH_BLOCK * x) + INITIAL_POSITION_X + 1
			block.position.y = (HEIGHT_BLOCK * y) + INITIAL_POSITION_Y + 1

			block.on_destroy.connect(func(pos: Vector2): on_destroy_block(pos))
			block.sound_destroy = sound_destroy

			add_child(block)

func on_destroy_block(pos: Vector2):
	print(pos.x, ' ', pos.y)
