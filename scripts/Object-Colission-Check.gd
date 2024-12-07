extends Area2D

@onready var sprite_2d: Sprite2D = $"../Sprite2D"


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("Flash") && process_mode != Node.PROCESS_MODE_DISABLED:
		
		var parent = get_parent()
		
		call_deferred("disable_node",parent)
			
		if parent.is_in_group("Layer0"):
			PlayerVariables.add_score(parent.position.y/100)

func disable_node(parent:Node) -> void:
		#parent.hide()
		#parent.process_mode = Node.PROCESS_MODE_DISABLED
		#process_mode = Node.PROCESS_MODE_DISABLED
		sprite_2d.modulate.a = 0.25
		
