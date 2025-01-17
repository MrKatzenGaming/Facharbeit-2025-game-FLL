extends Node2D

@onready var background: ColorRect = $Background
@onready var player: Node2D = $Player/CharacterBody2D
@onready var wall_top: ColorRect = $WallTop
@onready var wall_bottom: ColorRect = $WallBottom


var factor
var rangex = [0,1900]
var rangey1 = [1000,4200]
var rand = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	var diff = (wall_bottom.position.y-2*wall_bottom.size.y) - wall_top.position.y
	factor = 1/diff
	
	#rand.randomize()
	#
	#for i in $Objects.get_children():
		#var randx = rand.randi_range(rangex[0],rangex[1])
		#var randy = rand.randi_range(rangey1[0],rangey1[1])
		#rand.seed = rand.randi_range(randx,randy)
		#print_debug('randx: ' + str(randx) + ' randy: ' + str(randy))
		#if i != $Objects/Seestern:
			#i.position.x = randx
		#i.position.y = randy
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	background.color.b = clamp(1 - factor*player.position.y,0.3,1)
