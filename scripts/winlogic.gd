extends Control

var label: Label
@onready var blur_2: ColorRect = $blur2
@onready var button_back: Button = $ButtonBack
@onready var color_rect: ColorRect = $ColorRect

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	label = $InfoLabel
	
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
	
	#stoopid
	SignalBus.collected_anglerfisch.connect(func():$InfoAnglerfisch.self_modulate = Color(1,1,1,1))
	SignalBus.collected_feuerqualle.connect(func():$InfoQualle.self_modulate = Color(1,1,1,1))
	SignalBus.collected_dumbo_oktopus.connect(func():$InfoDumboOktopus.self_modulate = Color(1,1,1,1))
	SignalBus.collected_vampirtintenfisch.connect(func():$InfoVampirtintenfisch.self_modulate = Color(1,1,1,1))
	SignalBus.collected_kragenhai.connect(func():$InfoKragenhai.self_modulate = Color(1,1,1,1))
	SignalBus.collected_blobfisch.connect(func():$InfoBlobfisch.self_modulate = Color(1,1,1,1))
	SignalBus.collected_tiefseekoralle.connect(func():$InfoKoralle.self_modulate = Color(1,1,1,1))
	SignalBus.collected_plattenkoralle.connect(func():$InfoPlattenkoralle.self_modulate = Color(1,1,1,1))
	SignalBus.collected_seestern.connect(func():$InfoSeestern.self_modulate = Color(1,1,1,1))
	SignalBus.collected_drachenfisch.connect(func():$InfoDrachenfisch.self_modulate = Color(1,1,1,1))
	

func _on_backto_menu_button_pressed() -> void:
	get_tree().paused = 0
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

func _on_button_back_pressed() -> void:
	label.hide()
	blur_2.hide()
	button_back.hide()
	color_rect.hide()
	$InfoSprite.hide()

func _on_continue_pressed() -> void:
	$Outro.hide()

func _on_info_anglerfisch_pressed() -> void:
	label.show()
	blur_2.show()
	button_back.show()
	color_rect.show()
	label.text = StaticData.infoData["Anglerfisch"]
	$InfoSprite.texture = load("res://art/buttonsprites/Anglerfisch.png")
	$InfoSprite.show()

func _on_info_blobfisch_pressed() -> void:
	label.show()
	blur_2.show()
	button_back.show()
	color_rect.show()
	label.text = StaticData.infoData["Blobfisch"]
	$InfoSprite.texture = load("res://art/buttonsprites/Blobfisch.png")
	$InfoSprite.show()

func _on_info_drachenfisch_pressed() -> void:
	label.show()
	blur_2.show()
	button_back.show()
	color_rect.show()
	label.text = StaticData.infoData["Drachenfisch"]
	$InfoSprite.texture = load("res://art/buttonsprites/drachenfisch.PNG")
	$InfoSprite.show()

func _on_info_dumbo_oktopus_pressed() -> void:
	label.show()
	blur_2.show()
	button_back.show()
	color_rect.show()
	label.text = StaticData.infoData["Dumbo-Oktopus"]
	$InfoSprite.texture = load("res://art/buttonsprites/dumbo-oktopus.PNG")
	$InfoSprite.show()

func _on_info_koralle_pressed() -> void:
	label.show()
	blur_2.show()
	button_back.show()
	color_rect.show()
	label.text = StaticData.infoData["Tiefseekoralle"]
	$InfoSprite.texture = load("res://art/buttonsprites/koralle.PNG")
	$InfoSprite.show()

func _on_info_vampirtintenfisch_pressed() -> void:
	label.show()
	blur_2.show()
	button_back.show()
	color_rect.show()
	label.text = StaticData.infoData["Vampirtintenfisch"]
	$InfoSprite.texture = load("res://art/buttonsprites/Oktopus.png")
	$InfoSprite.show()

func _on_info_plattenkoralle_pressed() -> void:
	label.show()
	blur_2.show()
	button_back.show()
	color_rect.show()
	label.text = StaticData.infoData["Plattenkoralle"]
	$InfoSprite.texture = load("res://art/buttonsprites/plattenkoralle.PNG")
	$InfoSprite.show()

func _on_info_qualle_pressed() -> void:
	label.show()
	blur_2.show()
	button_back.show()
	color_rect.show()
	label.text = StaticData.infoData["Feuerqualle"]
	$InfoSprite.texture = load("res://art/buttonsprites/Qualle.png")
	$InfoSprite.show()

func _on_info_seestern_pressed() -> void:
	label.show()
	blur_2.show()
	button_back.show()
	color_rect.show()
	label.text = StaticData.infoData["Tiefsee-Seestern"]
	$InfoSprite.texture = load("res://art/buttonsprites/WandMitSeesternKurz.png")
	$InfoSprite.show()

func _on_info_kragenhai_pressed() -> void:
	label.show()
	blur_2.show()
	button_back.show()
	color_rect.show()
	label.text = StaticData.infoData["Kragenhai"]
	$InfoSprite.texture = load("res://art/buttonsprites/Wels.png")
	$InfoSprite.show()
