extends CharacterBody2D


const SPEED:float = 500.0
var FlashTime:int = 0

@onready var NodeLayer0:Node2D = get_tree().get_root().get_node("Main").get_node("ObjLayer0")
@onready var NodeLayer1:Node2D = get_tree().get_root().get_node("Main").get_node("ObjLayer1")
@onready var NodeLayer2:Node2D = get_tree().get_root().get_node("Main").get_node("ObjLayer2")
@onready var pause_menu:Control = $"PauseMenu"

@onready var color_rect_2: ColorRect = get_tree().get_root().get_node("Main").get_node("ColorRect2")
@onready var canvas_modulate: CanvasModulate = get_tree().get_root().get_node("Main").get_node("CanvasModulate")

var paused:bool = false

func _ready() -> void:

	NodeLayer0.show()
	NodeLayer0.process_mode = Node.PROCESS_MODE_ALWAYS
	
	NodeLayer1.hide()
	NodeLayer1.process_mode = Node.PROCESS_MODE_DISABLED
	NodeLayer2.hide()
	NodeLayer2.process_mode = Node.PROCESS_MODE_DISABLED

func _physics_process(_delta: float) -> void:

	check_movement()
	check_flash()
	
	if Input.is_action_pressed("ctrl_layer_down") && Input.is_action_pressed("ctrl_layer_up") && Input.is_action_just_pressed("ctrl_flash"):
		PlayerVariables.Debug = !PlayerVariables.Debug
		print("Debug: ", PlayerVariables.Debug)
	
	if PlayerVariables.Debug:
		$Label.text = "Score: " + str(PlayerVariables.Score) + "\nLayer: " + str(PlayerVariables.Layer)
	else:
		$Label.text = "Score: " + str(PlayerVariables.Score)
		
	if Input.is_action_just_pressed("ctrl_pause"):
		pause_menu.pauseMenu()
	
	if Input.is_action_just_pressed("ctrl_layer_up"):
		changeLayer(0)
	
	if Input.is_action_just_pressed("ctrl_layer_down"):
		changeLayer(1)
	
	move_and_slide()

func check_movement() -> void:
	# Get the input direction and handle the movement/deceleration
	# Handle Up-Down Movement
	var direction := Input.get_vector("ctrl_left","ctrl_right","ctrl_up","ctrl_down")
	if direction:
		velocity = direction * SPEED
	else:
		velocity.y = move_toward(velocity.y , 0 , SPEED)
		velocity.x = move_toward(velocity.x , 0 , SPEED)

func check_flash() -> void:
	if Input.is_action_just_pressed("ctrl_flash"):
		FlashTime = 10
	
	if FlashTime == 0:
		$Flash/FlashArea.process_mode = Node.PROCESS_MODE_DISABLED
		$Flash/FlashArea.hide()
		color_rect_2.hide()
		#canvas_modulate.show()
	else:
		FlashTime -= 1
		$Flash/FlashArea.process_mode = Node.PROCESS_MODE_ALWAYS
		$Flash/FlashArea.show()
		color_rect_2.show()
		canvas_modulate.hide()

func changeLayer(dir: int) -> void:
	if dir == 1 && PlayerVariables.Layer < 2:
		PlayerVariables.Layer += 1
	elif dir == 0 && PlayerVariables.Layer > 0:
		PlayerVariables.Layer -= 1
		
	match PlayerVariables.Layer:
		0:
			NodeLayer0.show()
			NodeLayer0.process_mode = Node.PROCESS_MODE_ALWAYS
			
			NodeLayer1.hide()
			NodeLayer1.process_mode = Node.PROCESS_MODE_DISABLED
			NodeLayer2.hide()
			NodeLayer2.process_mode = Node.PROCESS_MODE_DISABLED
			
		1:
			NodeLayer1.show()
			NodeLayer1.process_mode = Node.PROCESS_MODE_ALWAYS
			
			NodeLayer0.hide()
			NodeLayer0.process_mode = Node.PROCESS_MODE_DISABLED
			NodeLayer2.hide()
			NodeLayer2.process_mode = Node.PROCESS_MODE_DISABLED
			
		2:
			NodeLayer2.show()
			NodeLayer2.process_mode = Node.PROCESS_MODE_ALWAYS
			
			NodeLayer1.hide()
			NodeLayer1.process_mode = Node.PROCESS_MODE_DISABLED
			NodeLayer0.hide()
			NodeLayer0.process_mode = Node.PROCESS_MODE_DISABLED
			
