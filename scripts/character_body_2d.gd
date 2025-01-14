extends CharacterBody2D

var FlashTime:int = 0

@onready var pause_menu: Control = $"../PlayerCam/PauseMenu"

@onready var canvas_modulate: CanvasModulate = get_tree().get_root().get_node("Main").get_node("CanvasModulate")
@onready var flash_light: PointLight2D = $Flash/FlashLight

var paused:bool = false

func _physics_process(_delta: float) -> void:
	
	PlayerVariables.SPEED = 500 - (self.position.y/10)

	check_movement()
	check_flash()
	
	if Input.is_action_pressed("ctrl_layer_down") && Input.is_action_pressed("ctrl_layer_up") && Input.is_action_just_pressed("ctrl_flash"):
		PlayerVariables.Debug = !PlayerVariables.Debug
		print("Debug: ", PlayerVariables.Debug)
		
	if Input.is_action_just_pressed("ctrl_pause"):
		get_tree().paused = 1
		pause_menu.show()
		
	if Input.is_key_pressed(KEY_E):
		$Sonar.activate()
		
	if Input.is_key_pressed(KEY_P) && PlayerVariables.Debug:
		SignalBus.collected_anglerfisch.emit()
		SignalBus.collected_blobfisch.emit()
		SignalBus.collected_feuerqualle.emit()
		SignalBus.collected_dumbo_oktopus.emit()
		SignalBus.collected_vampirtintenfisch.emit()
		SignalBus.collected_kragenhai.emit()
		SignalBus.collected_tiefseekoralle.emit()
		SignalBus.collected_plattenkoralle.emit()
		SignalBus.collected_seestern.emit()
		SignalBus.collected_drachenfisch.emit()
		
		for i in range(10):
			SignalBus.collected_obj.emit()
		
	PlayerVariables.pos = self.position
	
	move_and_slide()

func check_movement() -> void:
	# Get the input direction and handle the movement/deceleration
	var direction := Input.get_vector("ctrl_left","ctrl_right","ctrl_up","ctrl_down")
	if direction:
		velocity = direction * PlayerVariables.SPEED
	else:
		velocity.y = move_toward(velocity.y , 0 , 20)
		velocity.x = move_toward(velocity.x , 0 , 20)

func check_flash() -> void:
	if Input.is_action_just_pressed("ctrl_flash"):
		$"../PlayerCam".screenshot()
		await RenderingServer.frame_post_draw
		FlashTime = 30
	
	if FlashTime == 0:
		$Flash/FlashArea.process_mode = Node.PROCESS_MODE_DISABLED
		$Flash/FlashArea.hide()
		flash_light.energy = 1
	else:
		FlashTime -= 1
		$Flash/FlashArea.process_mode = Node.PROCESS_MODE_ALWAYS
		$Flash/FlashArea.show()
		flash_light.energy = 10
