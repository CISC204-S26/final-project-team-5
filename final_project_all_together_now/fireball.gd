extends Area2D

@export var speed := 500
var direction := 1

func _process(delta):
	position.x += speed * direction * delta

func _on_body_entered(body):
	if body.has_method("take_fire_damage"):
		body.take_fire_damage()
		queue_free()
