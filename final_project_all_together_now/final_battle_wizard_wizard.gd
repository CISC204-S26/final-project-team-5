extends CharacterBody2D

@export var speed := 200
@export var jump_force := -500
@export var gravity := 900

func _physics_process(delta):

	#gravity
	if not is_on_floor():
		velocity.y += gravity * delta

	#whatsallthatmovement 
	var direction := 0

	if Input.is_key_pressed(KEY_A):
		direction -= 1
	if Input.is_key_pressed(KEY_D):
		direction += 1

	velocity.x = direction * speed

	#flipthathoe
	if direction < 0:
		$AnimatedSprite2D.flip_h = true
	elif direction > 0:
		$AnimatedSprite2D.flip_h = false

	#jump
	if Input.is_key_pressed(KEY_W) and is_on_floor():
		velocity.y = jump_force

	move_and_slide()

	#animation cycles
	if direction != 0:
		$AnimatedSprite2D.play("Walk")
	else:
		$AnimatedSprite2D.play("Idle")
@export var fireball_scene : PackedScene


func _process(delta):

	if Input.is_key_pressed(KEY_S):

		shoot_fireball()


func shoot_fireball():

	var fireball = fireball_scene.instantiate()

	fireball.position = global_position

	if $AnimatedSprite2D.flip_h:
		fireball.direction = -1
	else:
		fireball.direction = 1

	get_parent().add_child(fireball)
