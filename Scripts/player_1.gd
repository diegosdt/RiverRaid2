extends CharacterBody2D

# Velocidad de movimiento
var pixeles_por_metro: int = 70
var direccion: Vector2 = Vector2.ZERO
var velocidad: Vector2 = Vector2.ZERO
var rapidez: float = 3 * pixeles_por_metro

var pre_bullet = preload("res://bullet.tscn")
var readyToShoot: bool = true

func _ready():
	pass
	
func _input(_event):
	direccion = Vector2.ZERO
	# Detectar entrada del usuario
	if Input.is_action_pressed("ui_left"):
		direccion.x = -1  # Izquierda (corregido)
	if Input.is_action_pressed("ui_right"):
		direccion.x = 1   # Derecha (corregido)
	if Input.is_action_pressed("ui_up"):
		direccion.y = -1  # Arriba (corregido)
	if Input.is_action_pressed("ui_down"):
		direccion.y = 1   # Abajo (corregido)
	if Input.is_action_pressed("Disparar"):
		shoot()

func _physics_process(_delta):
	# Calcular velocidad normalizada
	velocidad = direccion.normalized() * rapidez
	
	# Mover el personaje
	velocity = velocidad
	move_and_slide()

func shoot():
	if readyToShoot:
		var bullet = pre_bullet.instantiate()
		get_parent().call_deferred("add_child", bullet)
		bullet.position.x = global_position.x +8
		bullet.position.y = global_position.y -85
		readyToShoot = false
		$sounds/misil.play()
		await get_tree().create_timer(0.3).timeout
		readyToShoot = true
			
func _on_area_2d_area_entered(area: Area2D):
	print("Colisión detectada con:", area.name)  # Te ayudará a ver si el nodo correcto está colisionando
	if area.is_in_group("salchicha"):
		print("salchicha crash")
		$sounds/impact.play()
		Global.energia -= 20
		$PointLight2D/AnimationPlayer.play("crash")
	if Global.energia < 1:
		get_tree().change_scene_to_file("res://Scenes/gameOver.tscn")
		
	if Global.puntos > 100:
			get_tree().change_scene_to_file("res://Scenes/Finished.tscn")
		
		

	
	
	

	
	
