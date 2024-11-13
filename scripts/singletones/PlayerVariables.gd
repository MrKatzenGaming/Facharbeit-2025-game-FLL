extends Node

var Debug:bool = false
var Layer:int = 0

var Score:float = 0


func add_score(score:float) -> void:
	PlayerVariables.Score += score
