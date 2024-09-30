extends CharacterBody2D


const SPEED = 1000.0
var showtimer = 0

func _physics_process(_delta: float) -> void:
	# Get the input direction and handle the movement/deceleration
	# Handle Up-Down Movement
	var dirud := Input.get_axis("ctrl_up", "ctrl_down")
	if dirud:
		velocity.y = dirud * SPEED
	else:
		velocity.y = move_toward(velocity.y , 0 , SPEED)
		
	# Handle Left-Right Movement
	var dirlr := Input.get_axis("ctrl_left", "ctrl_right")
	if dirlr:
		velocity.x = dirlr * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	move_and_slide()
	
	if Input.is_action_just_pressed("ctrl_flash"):
		showtimer = 10
	
	if showtimer == 0:
		$Flash/FlashArea.process_mode = Node.PROCESS_MODE_DISABLED
		$Flash/FlashArea.hide()
	else:
		showtimer -= 1
		$Flash/FlashArea.process_mode = Node.PROCESS_MODE_ALWAYS
		$Flash/FlashArea.show()
