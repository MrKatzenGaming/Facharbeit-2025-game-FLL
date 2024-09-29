extends CharacterBody2D


const SPEED = 1000.0


func _physics_process(_delta: float) -> void:

			
	# Handle jump.
	var dirud := Input.get_axis("ctrl_up", "ctrl_down")
	if dirud:
		velocity.y = dirud * SPEED
	else:
		velocity.y = move_toward(velocity.y , 0 , SPEED)
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var dirlr := Input.get_axis("ctrl_left", "ctrl_right")
	if dirlr:
		velocity.x = dirlr * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	move_and_slide()
