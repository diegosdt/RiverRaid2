extends Node2D

var pre_salchicha = preload("res://salchicha.tscn")  # Corregido
var pre_nubes = preload("res://nubes.tscn")
var pre_nubearriba = preload("res://nubearriba.tscn")
var pre_oil = preload("res://oil.tscn")

func _ready():
	$music/mainMusic.play()
	# Asegurar que el temporizador esté correctamente conectado
	var timer = $Timer
	if timer:
		timer.timeout.connect(_on_Timer_timeout)

func _on_Timer_timeout():
	randomize()
	var randomEnemy = randi_range(1, 4)  # Incluir salchicha
	
	if randomEnemy == 1:
		var salchicha = pre_salchicha.instantiate()
		call_deferred("add_child", salchicha)
		salchicha.global_position.x = randi_range(0, 500)
		salchicha.add_to_group("salchicha")

	elif randomEnemy == 2:
		var nubes = pre_nubes.instantiate()
		call_deferred("add_child", nubes)
		nubes.global_position.x = randi_range(0, 500)
		nubes.add_to_group("nubes")

	elif randomEnemy == 3:
		var nubearriba = pre_nubearriba.instantiate()
		call_deferred("add_child", nubearriba)
		nubearriba.global_position.x = randi_range(0, 500)
		nubearriba.add_to_group("nubearriba")
		
	elif randomEnemy == 4:
		var oil = pre_oil.instantiate()
		call_deferred("add_child", oil)
		oil.global_position.x = randi_range(0, 500)
		oil.add_to_group("oil")
		
	
func _physics_process(delta):
	$hub/energiaValor.text = str(Global.energia)
	$hub/puntosValor.text = str(Global.puntos)
	
	$ParallaxBackground/ParallaxLayer.motion_offset.y  += 2
	
	
