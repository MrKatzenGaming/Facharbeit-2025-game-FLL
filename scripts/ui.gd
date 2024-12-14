extends Control

@onready var score_label: Label = $ScoreLabel
@onready var timer_label: Label = $TimerLabel
var timer
var start_time_min = 0.5

func _ready() -> void:
	timer = get_tree().create_timer(start_time_min*60,false)

func _process(_delta: float) -> void:
	updateScore()
	updateTimer()

func updateScore() -> void:
	score_label.text = "Score: " + str(PlayerVariables.Score)
	
func updateTimer() -> void:
	var time:float = round(timer.time_left)
	var timemin:int = int(time/60)
	var timesec = time-timemin*60
	
	timer_label.text = "" + str(timemin) + ":" + str(timesec)
	
	if time == 0:
		pass # handle no time left logic
