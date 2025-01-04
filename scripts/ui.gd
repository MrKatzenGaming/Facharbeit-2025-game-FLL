extends Control

@onready var score_label: Label = $ScoreLabel
@onready var timer_label: Label = $TimerLabel
var timer
var start_time_min = 0.5

func _ready() -> void:
	timer = get_tree().create_timer(start_time_min*60,false)
	SignalBus.collected_anglerfisch.connect(func():$Anglerfisch.self_modulate = Color(1,1,1,1))
	SignalBus.collected_feuerqualle.connect(func():$Qualle.self_modulate = Color(1,1,1,1))
	SignalBus.collected_dumbo_oktopus.connect(func():pass)
	SignalBus.collected_vampirtintenfisch.connect(func():$Vampirtintenfisch.self_modulate = Color(1,1,1,1))
	SignalBus.collected_kragenhai.connect(func():$Kragenhai.self_modulate = Color(1,1,1,1))
	SignalBus.collected_blobfisch.connect(func():$Blobfisch.self_modulate = Color(1,1,1,1))
	SignalBus.collected_tiefseekoralle.connect(func():$Koralle.self_modulate = Color(1,1,1,1))
	SignalBus.collected_plattenkoralle.connect(func():$Plattenkoralle.self_modulate = Color(1,1,1,1))
	SignalBus.collected_seestern.connect(func():pass)
	SignalBus.collected_drachenfisch.connect(func():pass)

func _process(_delta: float) -> void:
	updateScore()
	updateTimer()

func updateScore() -> void:
	score_label.text = "Score: " + str(PlayerVariables.Score)
	
func updateTimer() -> void:
	var time:float = round(timer.time_left)
	var timemin:int = int(time/60)
	var timesec = time-timemin*60
	
	if timesec >= 10:
		timer_label.text = "" + str(timemin) + ":" + str(timesec)
	else:
		timer_label.text = "" + str(timemin) + ":0" + str(timesec)
	
	if time == 0:
		SignalBus.no_time_left.emit()
