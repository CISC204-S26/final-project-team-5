extends CharacterBody2D

@export var speed := 200
@export var jump_force := -500
@export var gravity := 900

func _physics_process(delta):

	#garvity
	if not is_on_floor():
		velocity.y += gravity * delta

	#aarowkey
	var direction := 0

	if Input.is_key_pressed(KEY_LEFT):
		direction -= 1
	if Input.is_key_pressed(KEY_RIGHT):
		direction += 1

	velocity.x = direction * speed

	#flippy
	if direction < 0:
		$AnimatedSprite2D.flip_h = true
	elif direction > 0:
		$AnimatedSprite2D.flip_h = false

	# Jump (Up Arrow)
	if Input.is_key_pressed(KEY_UP) and is_on_floor():
		velocity.y = jump_force

	move_and_slide()

	#animation
	if direction != 0:
		$AnimatedSprite2D.play("Walk")
	else:
		$AnimatedSprite2D.play("Idle")
