extends CharacterBody2D

@export var speed := 200
@export var jump_force := -500
@export var gravity := 900
@export var fireball_scene: PackedScene

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta

	var direction := 0

	if Input.is_key_pressed(KEY_A):
		direction -= 1
	if Input.is_key_pressed(KEY_D):
		direction += 1

	velocity.x = direction * speed

	if direction < 0:
		$AnimatedSprite2D.flip_h = true
	elif direction > 0:
		$AnimatedSprite2D.flip_h = false

	if Input.is_key_pressed(KEY_W) and is_on_floor():
		velocity.y = jump_force

	move_and_slide()

	if direction != 0:
		$AnimatedSprite2D.play("Walk")
	else:
		$AnimatedSprite2D.play("Idle")


func _process(delta):
	if Input.is_action_just_pressed("shoot_fireball"):
		shoot_fireball()


func shoot_fireball():
	if fireball_scene == null:
		print("ERROR: Fireball scene not assigned in Inspector")
		return

	var fireball = fireball_scene.instantiate()

	# direction based on sprite facing
	var dir := -1 if $AnimatedSprite2D.flip_h else 1

	# spawn from muzzle (NOT body)
	var muzzle = $Muzzle
	fireball.global_position = muzzle.global_position

	fireball.direction = dir

	get_tree().current_scene.add_child(fireball)
