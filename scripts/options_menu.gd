extends Control

@onready var resolution_dropdown: OptionButton = $MarginContainer/VBoxContainer/Resolution
@onready var fullscreen_checkbox: CheckBox = $MarginContainer/VBoxContainer/Fullscreen
@onready var volume_slider: HSlider = $MarginContainer/VBoxContainer/Volume
@onready var mute_checkbox: CheckBox = $MarginContainer/VBoxContainer/Mute


func _ready() -> void:
	_load_video_settings()
	_load_audio_settings()
	
func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

func _on_volume_value_changed(value: float) -> void:
	ConfigHandler.set_vol(value)
	
func _on_mute_toggled(toggled_on: bool) -> void:
	ConfigHandler.set_mute(toggled_on)

func _on_resolution_item_selected(index: int) -> void:
	ConfigHandler.set_res(index)

func _on_fullscreen_toggled(toggled_on: bool) -> void:
	ConfigHandler.set_fullscreen(toggled_on)

func _load_video_settings():
	var video_settings = ConfigFileHandler.load_video_settings()
	fullscreen_checkbox.button_pressed = video_settings.Fullscreen
	match video_settings.Resolution:
		"2560x1440": resolution_dropdown.selected = 0
		"1920x1080": resolution_dropdown.selected = 1
		"1600x900": resolution_dropdown.selected = 2
		"1290x720": resolution_dropdown.selected = 3
		
func _load_audio_settings():
	var audio_settings = ConfigFileHandler.load_audio_settings()
	volume_slider.value = audio_settings.Volume
	mute_checkbox.button_pressed = audio_settings.Muted


func _on_clear_screenshots_pressed() -> void:
	var dir = DirAccess.open("user://Screenshots")
	for n in dir.get_files():
		dir.remove(n)
