extends Camera2D


var screenshot_count = 1

func _ready() -> void:
	var dir = DirAccess.open("user://")
	dir.make_dir("Screenshots")
	
	dir = DirAccess.open("user://Screenshots")
	for n in dir.get_files():
		screenshot_count += 1
	
func screenshot():
	await RenderingServer.frame_post_draw
	
	var viewport = get_viewport()
	var img = viewport.get_texture().get_image()
	img.save_png("user://Screenshots/ScreenShot" + str(screenshot_count)+ ".png")
	screenshot_count += 1
