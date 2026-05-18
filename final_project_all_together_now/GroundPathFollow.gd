extends PathFollow2D

@export var speed := 0.3

func _process(delta):

	progress_ratio += speed * delta
