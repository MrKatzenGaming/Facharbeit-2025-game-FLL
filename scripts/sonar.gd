extends Sprite2D

var timer = 1000
@onready var cooldown: Timer = $"../CooldownTimer"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalBus.sonar_entered.connect(_on_solar_entered)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#print(timer)
	print(cooldown.time_left)

func activate() -> void:
	if cooldown.time_left == 0 && PlayerVariables.AbilityCount > 0:
		_run()
		cooldown.start()
		PlayerVariables.AbilityCount -= 1
		
	
		
func _on_solar_entered() -> void:
	timer = 0
	
func _run() -> void:
	self.scale = Vector2(1,1)
	timer = 1000
	while timer >=1:
		self.scale += Vector2(0.05,0.05)
		timer -=1
		await get_tree().create_timer(0.01).timeout
