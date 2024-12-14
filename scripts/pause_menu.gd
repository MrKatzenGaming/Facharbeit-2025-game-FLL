#Pausemenue from https://www.youtube.com/watch?v=JEQR4ALlwVU
extends Control

var paused = false

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ctrl_pause"):
		self.hide()
		get_tree().paused = 0

func _on_resume_pressed() -> void:
	self.hide()
	get_tree().paused = 0


func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_main_menu_pressed() -> void:
	self.hide()
	get_tree().paused = 0
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
