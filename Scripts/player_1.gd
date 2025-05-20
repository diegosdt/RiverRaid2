extends CharacterBody2D

# Velocidad de movimiento
var pixeles_por_metro: int = 24
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
		bullet.position.x = global_position.x
		bullet.position.y = global_position.y
		readyToShoot = false
		await get_tree().create_timer(1.0).timeout
		readyToShoot = true
			
		
	
