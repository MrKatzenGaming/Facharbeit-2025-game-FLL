extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalBus.collected_anglerfisch.connect(func():$InfoAnglerfisch.disabled = false)
	SignalBus.collected_feuerqualle.connect(func():$InfoQualle.disabled = false)
	SignalBus.collected_dumbo_oktopus.connect(func():$InfoDumboOktopus.disabled = false)
	SignalBus.collected_vampirtintenfisch.connect(func():$InfoVampirtintenfisch.disabled = false)
	SignalBus.collected_kragenhai.connect(func():$InfoKragenhai.disabled = false)
	SignalBus.collected_blobfisch.connect(func():$InfoBlobfisch.disabled = false)
	SignalBus.collected_tiefseekoralle.connect(func():$InfoKoralle.disabled = false)
	SignalBus.collected_plattenkoralle.connect(func():$InfoPlattenkoralle.disabled = false)
	SignalBus.collected_seestern.connect(func():$InfoSeestern.disabled = false)
	SignalBus.collected_drachenfisch.connect(func():$InfoDrachenfisch.disabled = false)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_backto_menu_button_pressed() -> void:
	get_tree().paused = 0
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
