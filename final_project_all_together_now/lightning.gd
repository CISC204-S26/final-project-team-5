extends Area2D

@export var speed := 600
var direction := Vector2.UP

func _process(delta):
	position += direction * speed * delta


func _on_body_entered(body):
	if body.has_method("take_lightning_damage"):
		body.take_lightning_damage()
		queue_free()
