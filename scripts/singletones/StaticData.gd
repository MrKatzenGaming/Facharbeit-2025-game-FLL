extends Node


var infoData = {}

var data_file_path = "res://data/infodata.json"

func _ready() -> void:
	infoData = load_json_data(data_file_path)
	#print(infoData)

func load_json_data(filePath: String):
	if FileAccess.file_exists(filePath):
		
		var dataFile: FileAccess = FileAccess.open(filePath,FileAccess.READ)
		var parsedResult = JSON.parse_string(dataFile.get_as_text())
		
		if parsedResult is Dictionary:
			return parsedResult
		else:
			print("Error reading file")
	else:
		print("File doesn't exist")
