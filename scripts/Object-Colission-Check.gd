extends Area2D



func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("Flash") && process_mode != Node.PROCESS_MODE_DISABLED:
		
		var parent = get_parent()
		
		call_deferred("disable_node",parent)
		
		if parent.is_in_group("Layer0"):
			PlayerVariables.add_Score(10)
		elif parent.is_in_group("Layer1"):
			PlayerVariables.add_Score(20)
		elif parent.is_in_group("Layer2"):
			PlayerVariables.add_Score(30)

func disable_node(parent:Node) -> void:
		parent.hide()
		parent.process_mode = Node.PROCESS_MODE_DISABLED
		process_mode = Node.PROCESS_MODE_DISABLED
