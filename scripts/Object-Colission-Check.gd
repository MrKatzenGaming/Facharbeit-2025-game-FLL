extends Area2D

var sprite_2d
var is_animated = false
func _ready() -> void:
	if $"../AnimatedSprite2D":
		sprite_2d = $"../AnimatedSprite2D"
		is_animated = true
	else:
		sprite_2d = $"../Sprite2D"
		is_animated = false

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("Flash") && process_mode != Node.PROCESS_MODE_DISABLED:
		
		var parent = get_parent()
		
		call_deferred("disable_node",parent)
			
		if parent.is_in_group("Obj"):
			PlayerVariables.add_score(parent.position.y/100)
			for group in parent.get_groups():
				match group:
					"Anglerfisch":
						SignalBus.collected_anglerfisch.emit()
					"Blobfisch":
						SignalBus.collected_blobfisch.emit()
					"Qualle":
						SignalBus.collected_feuerqualle.emit()
					"DumboOktopus":
						SignalBus.collected_dumbo_oktopus.emit()
					"Vampirtintenfisch":
						SignalBus.collected_vampirtintenfisch.emit()
					"Kragenhai":
						SignalBus.collected_kragenhai.emit()
					"Koralle":
						SignalBus.collected_tiefseekoralle.emit()
					"Plattenkoralle":
						SignalBus.collected_plattenkoralle.emit()
					"Seestern":
						SignalBus.collected_seestern.emit()
					"Drachenfisch":
						SignalBus.collected_drachenfisch.emit()
	if area.is_in_group("Sonar") && process_mode != Node.PROCESS_MODE_DISABLED:
		SignalBus.sonar_entered.emit()
func disable_node(parent:Node) -> void:
		#parent.hide()
		parent.process_mode = Node.PROCESS_MODE_DISABLED
		process_mode = Node.PROCESS_MODE_DISABLED
		if is_animated:
			sprite_2d.modulate.a = 0.25
			sprite_2d.pause()
		else:
			sprite_2d.modulate.a = 0.25
		
