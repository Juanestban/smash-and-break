extends CharacterBody2D

@export var area_game_over: AreaGameOver

const SPEED = 200.0

var is_playning = false
var is_first_rebound = true
var x = 0
var y = -1
@onready var sound := AudioStreamPlayer.new()

@onready var initial_position := position

func _ready():
	($BallArea as BallArea)._on_rebound.connect(move_rebound)
	area_game_over.on_game_over.connect(reset_position)

	sound.stream = preload('res://Sounds/rebound.ogg')
	sound.volume_db = -10
	add_child(sound)

func _physics_process(_delta):
	if Input.is_action_just_pressed("start"):
		is_playning = true

	if is_playning:
		move()
	else:
		var direction = Input.get_axis("move_left", "move_right")
		
		if direction:
			velocity.x = direction

		move_and_slide()


func move():
	if is_first_rebound:
		velocity.y = -1 * SPEED
		x = 0
		y = -1
	else:
		velocity.x = x * SPEED
		velocity.y = y * SPEED

	move_and_slide()

func move_rebound(direction: StringName):
	if direction == 'bottom' and is_first_rebound:
		return

	is_first_rebound = false

	if not direction.begins_with('block'):
		sound.play()
	
	# block for queque remove
	if direction.begins_with('block'):
		if direction.ends_with('top'):
			y = -1
			return

		if direction.ends_with('bottom'):
			y = 1
			return

	if direction == 'top':
		y = 1
		return

	if direction.ends_with('right') or direction.ends_with('left'):
		x *= -1
		return

	var orientation = Input.get_axis("move_left", "move_right")

	y = -1

	if orientation and direction == 'bottom':
		x = -1 if orientation == 1 else 1
		return
	
	if direction == 'bottom':
		x *= -1

func reset_position():
	position = initial_position
	is_playning = false
	is_first_rebound = true
	velocity = Vector2.ZERO
