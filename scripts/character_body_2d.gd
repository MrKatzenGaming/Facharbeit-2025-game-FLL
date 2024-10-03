extends CharacterBody2D


const SPEED = 500.0
var flashtime = 0

func _physics_process(_delta: float) -> void:

	check_movement()
	check_flash()
	
	move_and_slide()

func check_movement() -> void:
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

func check_flash() -> void:
	if Input.is_action_just_pressed("ctrl_flash"):
		flashtime = 10
	
	if flashtime == 0:
		$Flash/FlashArea.process_mode = Node.PROCESS_MODE_DISABLED
		$Flash/FlashArea.hide()
	else:
		flashtime -= 1
		$Flash/FlashArea.process_mode = Node.PROCESS_MODE_ALWAYS
		$Flash/FlashArea.show()
