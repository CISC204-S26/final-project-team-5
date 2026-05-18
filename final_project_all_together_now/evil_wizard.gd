extends CharacterBody2D

var fire_hits := 0
var lightning_hits := 0
var phase := 1

var previous_x := 0.0


@onready var ground_follow = get_parent()
@onready var air_follow = get_tree().get_first_node_in_group("air_follow")

func _ready():
	phase = 1
	$AnimatedSprite2D.play("Walk")
	previous_x = global_position.x


func _process(delta):
	# Flip based on movement direction
	if global_position.x > previous_x:
		$AnimatedSprite2D.flip_h = true
	elif global_position.x < previous_x:
		$AnimatedSprite2D.flip_h = false

	previous_x = global_position.x

	if $AnimatedSprite2D.animation != "Walk":
		$AnimatedSprite2D.play("Walk")


# fire (phase 1)
func take_fire_damage():
	if phase != 1:
		return

	fire_hits += 1
	flash_red()

	if fire_hits >= 2:
		start_phase_two()


# (move to air)
func start_phase_two():
	phase = 2

	print("Transitioning to Phase 2")

	# Safety check
	if air_follow == null:
		print("ERROR: AirFollow not found (check group 'air_follow')")
		return

	
	if get_parent():
		get_parent().remove_child(self)

	air_follow.add_child(self)

	global_position = air_follow


# lightning (phase 2)
func take_lightning_damage():
	if phase != 2:
		return

	lightning_hits += 1
	flash_red()

	if lightning_hits >= 2:
		die()


# damage
func flash_red():
	$AnimatedSprite2D.modulate = Color.RED
	await get_tree().create_timer(0.15).timeout
	$AnimatedSprite2D.modulate = Color.WHITE


# death
func die():
	queue_free()
