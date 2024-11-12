extends Node

func _ready() -> void:
	load_audio_settings()
	load_video_settings()

func set_res(index: int):
	match index:
		0: 
			DisplayServer.window_set_size(Vector2i(2560,1440))
			ConfigFileHandler.save_video_setting("Resolution","2560x1440")
		1: 
			DisplayServer.window_set_size(Vector2i(1920,1080))
			ConfigFileHandler.save_video_setting("Resolution","1920x1080")
		2: 
			DisplayServer.window_set_size(Vector2i(1600,900))
			ConfigFileHandler.save_video_setting("Resolution","1600x900")
		3: 
			DisplayServer.window_set_size(Vector2i(1290,720))
			ConfigFileHandler.save_video_setting("Resolution","1290x720")

func set_vol(volume: float):
	AudioServer.set_bus_volume_db(0,linear_to_db(volume))
	ConfigFileHandler.save_audio_settings("Volume",volume)

func set_mute(muted: bool):
	AudioServer.set_bus_mute(0,muted)
	ConfigFileHandler.save_audio_settings("Muted",muted)

func set_fullscreen(fullscreen: bool):
	ConfigFileHandler.save_video_setting("Fullscreen",fullscreen)
	
	if fullscreen:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		
func load_video_settings():
	var video_settings = ConfigFileHandler.load_video_settings()
	set_fullscreen(video_settings.Fullscreen)
	match video_settings.Resolution:
		"2560x1440": set_res(0)
		"1920x1080": set_res(1)
		"1600x900": set_res(2)
		"1290x720": set_res(3)
		
func load_audio_settings():
	var audio_settings = ConfigFileHandler.load_audio_settings()
	set_vol(audio_settings.Volume)
	set_mute(audio_settings.Muted)
