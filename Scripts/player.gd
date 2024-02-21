extends Node2D
class_name Player

@export var area_game_over: AreaGameOver

func _ready():
	area_game_over.on_game_over.connect(($character as Character).reset_position)
