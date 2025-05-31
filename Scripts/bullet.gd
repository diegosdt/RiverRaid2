extends CharacterBody2D

func _physics_process(delta):
	position.y -= 10


func _on_area_2d_area_entered(area: Area2D):
	if area.is_in_group("salchicha"):
		Global.puntos += 5
		Global.playsound("enemyImpact")
		queue_free()
		



	
