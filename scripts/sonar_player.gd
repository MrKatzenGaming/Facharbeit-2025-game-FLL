extends Sprite2D

var timer
var timer2
@onready var cooldown: Timer = $"../CooldownTimer"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.scale = Vector2(0,0)
	self.process_mode = Node.PROCESS_MODE_DISABLED
	#cooldown.wait_time = 0.05 if PlayerVariables.Debug else 30

func activate() -> void:
	if cooldown.time_left == 0 && PlayerVariables.AbilityCount > 0:
		
		cooldown.start()
		PlayerVariables.AbilityCount -= 1
		
		for i in range(5):
			var s = self.duplicate()
			add_child(s)
			_run(s)
			await get_tree().create_timer(1).timeout

		
func _on_solar_entered() -> void:
	#timer = 0
	#timer2 = 25
	#while timer2 >= 1:
		#timer2 -= 1
		#self.self_modulate.a -= 0.05
		#await get_tree().create_timer(0.01).timeout
	#
	#self.scale = Vector2(0,0)
	#self.process_mode = Node.PROCESS_MODE_DISABLED
	pass
	
func _run(s) -> void:
	s.process_mode = Node.PROCESS_MODE_INHERIT
	s.self_modulate.a = 0.5
	s.scale = Vector2(0.0,0.0)
	timer = 1000
	while s.scale.x < 8:
		s.scale += Vector2(0.05,0.05)
		timer -=1
		await get_tree().create_timer(0.01).timeout
		
	timer = 0
	timer2 = 25
	while timer2 >= 1:
		timer2 -= 1
		s.self_modulate.a -= 0.05
		await get_tree().create_timer(0.01).timeout
	
	s.scale = Vector2(0,0)
	s.process_mode = Node.PROCESS_MODE_DISABLED
	s.queue_free()
