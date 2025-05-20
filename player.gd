extends CharacterBody2D

# Velocidad de movimiento
var speed = 200

# Función que se llama cada frame
func _physics_process(delta):  # Cambiado a _physics_process para movimiento
	var velocity = Vector2() # Vector de velocidad inicial
	
	# Detectar entrada del usuario
	if Input.is_action_pressed("D"):
		velocity.x += 1 # Mover a la derecha
	if Input.is_action_pressed("A"):
		velocity.x -= 1 # Mover a la izquierda
	if Input.is_action_pressed("S"):
		velocity.y += 1 # Mover hacia abajo
	
	# Normalizar velocidad para movimiento diagonal
	velocity = velocity.normalized() * speed
	
	# Aplicar movimiento (Godot 4 syntax)
	velocity = move_and_slide()  # Asignamos la velocidad primero
	move_and_slide()  # Luego aplicamos el movimientodada
