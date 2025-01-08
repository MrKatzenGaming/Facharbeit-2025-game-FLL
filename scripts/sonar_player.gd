extends Sprite2D

var timer
var timer2
@onready var cooldown: Timer = $"../CooldownTimer"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalBus.sonar_entered.connect(_on_solar_entered)
	self.scale = Vector2(0,0)
	self.process_mode = Node.PROCESS_MODE_DISABLED
	cooldown.wait_time = 0.05 if PlayerVariables.Debug else 30


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	#print(timer)
	print(cooldown.time_left)


func activate() -> void:
	if cooldown.time_left == 0 && PlayerVariables.AbilityCount > 0:
		_run()
		cooldown.start()
		PlayerVariables.AbilityCount -= 1
		
func _on_solar_entered() -> void:
	timer = 0
	timer2 = 25
	while timer2 >= 1:
		timer2 -= 1
		self.self_modulate.a -= 0.05
		await get_tree().create_timer(0.01).timeout
	
	self.scale = Vector2(0,0)
	self.process_mode = Node.PROCESS_MODE_DISABLED
	
func _run() -> void:
	self.process_mode = Node.PROCESS_MODE_INHERIT
	self.self_modulate.a = 0.5
	self.scale = Vector2(0.0,0.0)
	timer = 1000
	while timer >=1:
		self.scale += Vector2(0.05,0.05)
		timer -=1
		await get_tree().create_timer(0.01).timeout
