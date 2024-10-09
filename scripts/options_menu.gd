extends Control

func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")

func _on_volume_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(0,value)

func _on_mute_toggled(toggled_on: bool) -> void:
	AudioServer.set_bus_mute(0,toggled_on)

func _on_resolution_item_selected(index: int) -> void:
	match index:
		0: DisplayServer.window_set_size(Vector2i(1920,1080))
		1: DisplayServer.window_set_size(Vector2i(1600,900))
		2: DisplayServer.window_set_size(Vector2i(1290,720))
