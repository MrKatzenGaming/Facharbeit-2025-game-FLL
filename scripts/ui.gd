extends Control

@onready var score_label: Label = $ScoreLabel
@onready var timer_label: Label = $TimerLabel
@onready var time_up: Control = $TimeUp
@onready var color_rect: ColorRect = $NinePatchRect/ColorRect

var timer
var start_time_min = 2

var collected_objs = 0

func _ready() -> void:
	timer = get_tree().create_timer(start_time_min*60,false)
	
	SignalBus.collected_anglerfisch.connect(func():$Anglerfisch.self_modulate = Color(1,1,1,1))
	SignalBus.collected_feuerqualle.connect(func():$Qualle.self_modulate = Color(1,1,1,1))
	SignalBus.collected_dumbo_oktopus.connect(func():$DumboOktopus.self_modulate = Color(1,1,1,1))
	SignalBus.collected_vampirtintenfisch.connect(func():$Vampirtintenfisch.self_modulate = Color(1,1,1,1))
	SignalBus.collected_kragenhai.connect(func():$Kragenhai.self_modulate = Color(1,1,1,1))
	SignalBus.collected_blobfisch.connect(func():$Blobfisch.self_modulate = Color(1,1,1,1))
	SignalBus.collected_tiefseekoralle.connect(func():$Koralle.self_modulate = Color(1,1,1,1))
	SignalBus.collected_plattenkoralle.connect(func():$Plattenkoralle.self_modulate = Color(1,1,1,1))
	SignalBus.collected_seestern.connect(func():$Seestern.self_modulate = Color(1,1,1,1))
	SignalBus.collected_drachenfisch.connect(func():$Drachenfisch.self_modulate = Color(1,1,1,1))
	
	

func startgame() -> void:
	SignalBus.game_start = 0
	$Intro.show()
	get_tree().paused = true
	
func _on_play_pressed() -> void:
	$Intro.hide()
	get_tree().paused = false
	
func _process(_delta: float) -> void:
	if SignalBus.game_start:
		startgame()
	updateScore()
	updateTimer()
	
	if SignalBus.collected_obj >= 10:
		SignalBus.collected_obj = 0
		await get_tree().create_timer(0.5).timeout
		SignalBus.game_won.emit()
		get_tree().paused = true
		$Win.show()
		
	#var fac:float = 902/3930
	var fac = 0.22951654
	var p: float = PlayerVariables.pos.y * fac
	color_rect.position.y = p
	

func updateScore() -> void:
	if PlayerVariables.Debug:
		score_label.text = "Score: " + str(PlayerVariables.Score) + "\nSPEED: " + str(PlayerVariables.SPEED)
	else:
		score_label.text = "Score: " + str(PlayerVariables.Score)
	
func updateTimer() -> void:
	var time:float = round(timer.time_left)
	var timemin:int = int(time/60)
	var timesec = time-timemin*60
	
	if timesec >= 10:
		timer_label.text = "" + str(timemin) + ":" + str(timesec)
	else:
		timer_label.text = "" + str(timemin) + ":0" + str(timesec)
		
	if time <= 30 and time >= 29.5:
		warning()
	
	if time == 0:
		SignalBus.no_time_left.emit()
		
		if SignalBus.collected_obj >= 7:
			$TimeUp/Outro.text = "Wow, du hast fast alle Tiere gefunden. Herzlichen Glückwunsch! Versuche es erneut und finde auch die restlichen Tiere um deine Mission erfolgreich zu beenden. \n\nHier kannst du nun die gefundenen Tiere weiter erforschen und noch mehr über sie lernen!"
		elif SignalBus.collected_obj < 3:
			$TimeUp/Outro.text = ""
		
		SignalBus.collected_obj = 0
		
		get_tree().paused = true
		time_up.show()


		
func _on_back_button_pressed() -> void:
	get_tree().paused = 0
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

func warning() -> void:
	$"30swarning".show()
	await get_tree().create_timer(3).timeout
	$"30swarning".hide()

func _on_button_pressed() -> void:
	$Win.show()
	$Win/WinLabel.text = ""
	$Win/Outro.hide()
	$Win.showall()
