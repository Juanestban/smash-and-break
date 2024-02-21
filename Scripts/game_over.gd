extends Area2D
class_name AreaGameOver

signal on_game_over

func _ready():
	area_entered.connect(end_game)

func end_game(area: Area2D):
	if area is BallArea:
		print("Game Over")
		on_game_over.emit()
