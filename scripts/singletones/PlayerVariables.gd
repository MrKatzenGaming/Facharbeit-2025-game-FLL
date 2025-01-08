extends Node

var Debug:bool = true

var Score:float = 0
var AbilityCount:int = 999999999 if Debug else 3
var SPEED:float = 500
var pos

func add_score(score:float) -> void:
	PlayerVariables.Score += score
	
