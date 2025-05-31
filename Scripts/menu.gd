extends Node2D


func _on_button_pressed() -> void:
	Global.energia =100
	Global.puntos =0
	get_tree().change_scene_to_file("res://main.tscn")
	
func _ready() -> void:
	$music/menuMusic.play()	
