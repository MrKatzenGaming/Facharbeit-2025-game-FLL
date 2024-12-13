extends Node2D

@onready var background: ColorRect = $Background
@onready var player: Node2D = $Player/CharacterBody2D
@onready var wall_top: ColorRect = $WallTop
@onready var wall_bottom: ColorRect = $WallBottom

var factor

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var diff = (wall_bottom.position.y-2*wall_bottom.size.y) - wall_top.position.y
	factor = 1/diff

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	background.color.b = clamp(1 - factor*player.position.y,0.3,1)
