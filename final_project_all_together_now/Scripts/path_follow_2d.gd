extends PathFollow2D

@export var speed := 0.1

var previous_x := 0.0

func _ready():
	$Traveler.play("Walk")   # Play animation
	previous_x = position.x


func _process(delta):

	# Move along path
	progress_ratio += delta * speed

	# Flip depending on movement direction
	if position.x < previous_x:
		$Traveler.flip_h = true      # moving left

	elif position.x > previous_x:
		$Traveler.flip_h = false     # moving right

	previous_x = position.x
