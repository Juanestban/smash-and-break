extends Panel

const MINUTE = 60
const SECONDS = 60

@onready var time_start = 0
@onready var elapsed_time = 0
@onready var is_playning = false

func _ready():
	time_start = 0

func _process(_delta):
	if Input.is_action_just_pressed("start"):
		is_playning = true
	
	if is_playning:
		var timer_elapsed = format_time()

		$Label.text = timer_elapsed

func format_time() -> String:
	var sec = Time.get_ticks_msec() / 1000
	elapsed_time = sec
	time_start = sec
	var minute_text_elapsed = '00'
	var second_text_elapsed = str(elapsed_time)
	
	if elapsed_time >= SECONDS:
		var minute_sanitized = floor(elapsed_time / MINUTE)
		minute_text_elapsed = '0' + str(minute_sanitized)
		elapsed_time -= 60
		second_text_elapsed = str(elapsed_time)
	
	if elapsed_time < 10:
		second_text_elapsed = "0" + second_text_elapsed

	return minute_text_elapsed + ":" + second_text_elapsed
