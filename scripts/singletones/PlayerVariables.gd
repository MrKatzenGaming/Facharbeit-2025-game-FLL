extends Node

var Debug:bool = false

var Score:float = 0
var AbilityCount:int = 3

func add_score(score:float) -> void:
	PlayerVariables.Score += score
	
