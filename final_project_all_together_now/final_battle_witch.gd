extends CharacterBody2D

@export var speed := 200
@export var jump_force := -500
@export var gravity := 900
@export var lightning_scene: PackedScene

func _physics_process(delta):

	# Gravity
	if not is_on_floor():
		velocity.y += gravity * delta

	# Movement
	var direction := 0

	if Input.is_key_pressed(KEY_LEFT):
		direction -= 1
	if Input.is_key_pressed(KEY_RIGHT):
		direction += 1

	velocity.x = direction * speed

	# Flip sprite
	if direction < 0:
		$AnimatedSprite2D.flip_h = true
	elif direction > 0:
		$AnimatedSprite2D.flip_h = false

	# Jump
	if Input.is_key_pressed(KEY_UP) and is_on_floor():
		velocity.y = jump_force

	move_and_slide()

	# Animation
	if direction != 0:
		$AnimatedSprite2D.play("Walk")
	else:
		$AnimatedSprite2D.play("Idle")


func _process(delta):
	if Input.is_action_just_pressed("shoot_lightning"):
		shoot_lightning()


func shoot_lightning():
	if lightning_scene == null:
		print("ERROR: Lightning scene not assigned")
		return

	var muzzle = $LightningMuzzle

	if muzzle == null:
		print("ERROR: LightningMuzzle node not found")
		return

	var bolt = lightning_scene.instantiate()

	# Add first so transforms are valid in world
	get_tree().current_scene.add_child(bolt)

	# PERFECT spawn alignment (fixes offset issues)
	bolt.global_transform = muzzle.global_transform

	# direction for movement script
	bolt.direction = Vector2.UP
