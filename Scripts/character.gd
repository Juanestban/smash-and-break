extends CharacterBody2D
class_name Character

const SPEED = 300.0

@onready var initial_position := position

func _physics_process(_delta):
	var direction = Input.get_axis("move_left", "move_right")

	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	velocity.y = 0

	move_and_slide()

func reset_position():
	position = initial_position
