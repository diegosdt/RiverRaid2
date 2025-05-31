extends Node2D


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("player"):  # Se corrige "area.is.in_group" por "area.is_in_group"
		if Global.energia < 100:
			Global.energia +=10
		queue_free()

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	pass # Replace with function body.
