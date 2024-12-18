extends CharacterBody2D


const SPEED:float = 500.0
var FlashTime:int = 0

@onready var pause_menu: Control = $"../PlayerCam/PauseMenu"

@onready var color_rect_2: ColorRect = get_tree().get_root().get_node("Main").get_node("ColorRect2")
@onready var canvas_modulate: CanvasModulate = get_tree().get_root().get_node("Main").get_node("CanvasModulate")
@onready var flash_light: PointLight2D = $Flash/FlashLight

var paused:bool = false


func _physics_process(_delta: float) -> void:

	check_movement()
	check_flash()
	
	if Input.is_action_pressed("ctrl_layer_down") && Input.is_action_pressed("ctrl_layer_up") && Input.is_action_just_pressed("ctrl_flash"):
		PlayerVariables.Debug = !PlayerVariables.Debug
		print("Debug: ", PlayerVariables.Debug)
		
	if Input.is_action_just_pressed("ctrl_pause"):
		get_tree().paused = 1
		pause_menu.show()
		
	
	move_and_slide()

func check_movement() -> void:
	# Get the input direction and handle the movement/deceleration
	# Handle Up-Down Movement
	var direction := Input.get_vector("ctrl_left","ctrl_right","ctrl_up","ctrl_down")
	if direction:
		velocity = direction * SPEED
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
		#color_rect_2.hide()
		##canvas_modulate.show()
		flash_light.energy = 1
	else:
		FlashTime -= 1
		$Flash/FlashArea.process_mode = Node.PROCESS_MODE_ALWAYS
		$Flash/FlashArea.show()
		#color_rect_2.show()
		#canvas_modulate.hide()
		flash_light.energy = 10
