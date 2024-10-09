extends Node

var Debug:bool = false
var Layer:int = 0

var Score:int = 0


func add_score(score:int) -> void:
	PlayerVariables.Score += score
