extends Area2D

var sprite_2d
var is_animated = false
var timer: int
var timer2: int
var sonar:  Sprite2D

func _ready() -> void:
	sonar = $"../Sonar"
	
	if $"../AnimatedSprite2D":
		sprite_2d = $"../AnimatedSprite2D"
		is_animated = true
	else:
		sprite_2d = $"../Sprite2D"
		is_animated = false
	
	if sonar:
		sonar.scale = Vector2(0,0)
		sonar.process_mode = Node.PROCESS_MODE_DISABLED

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("Flash") && process_mode != Node.PROCESS_MODE_DISABLED:
		
		var parent = get_parent()
		
		call_deferred("disable_node",parent)
			
		if parent.is_in_group("Obj"):
			PlayerVariables.add_score(parent.position.y/100)
			SignalBus.collected_obj += 1
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
		if sonar:
			
			for i in range(5):
				var s = sonar.duplicate()
				add_child(s)
				_run_sonar(s)
				await get_tree().create_timer(1).timeout
				
func disable_node(parent:Node) -> void:
		#parent.hide()
		parent.process_mode = Node.PROCESS_MODE_DISABLED
		process_mode = Node.PROCESS_MODE_DISABLED
		if is_animated:
			sprite_2d.modulate.a = 0.25
			sprite_2d.pause()
		else:
			sprite_2d.modulate.a = 0.25
			
func _run_sonar(sonaro) -> void:
	sonaro.process_mode = Node.PROCESS_MODE_INHERIT
	sonaro.self_modulate.a = 0.5
	sonaro.scale = Vector2(0.0,0.0)
	timer = 500
	while timer >=1:
		sonaro.scale += Vector2(0.05,0.05)
		timer -=1
		await get_tree().create_timer(0.01).timeout
		
	timer2 = 25
	while timer2 >= 1:
		timer2 -= 1
		sonaro.self_modulate.a -= 0.05
		await get_tree().create_timer(0.01).timeout
	
	sonaro.scale = Vector2(0,0)
	sonaro.process_mode = Node.PROCESS_MODE_DISABLED
	
	sonaro.queue_free()
		
