extends Node

var puntos: int = 0 
var energia: int = 100 

func playsound(sound):
	if sound == "enemyImpact":
		get_node("/root/main/sounds/enemyImpact").play()
		
