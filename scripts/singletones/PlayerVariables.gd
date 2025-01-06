extends Node

var Debug:bool = true

var Score:float = 0
var AbilityCount:int = 999999999 if Debug else 3

func add_score(score:float) -> void:
	PlayerVariables.Score += score
	
