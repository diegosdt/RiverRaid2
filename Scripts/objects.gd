extends Node2D


func _ready():
	pass
	
	

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("bullet"):
		$Sprite2D/explosion.play("animation")
		$Sprite2D/ship.visible = false
	
		
		


func _on_animation_player_animation_finished(anim_name: StringName):
	pass # Replace with function body.
	queue_free()
	

func _on_explosion_animation_finished() -> void:
	pass # Replace with function body.
	queue_free()
