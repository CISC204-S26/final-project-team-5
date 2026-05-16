extends CharacterBody2D

@export var speed = 100
func _process(delta: float) -> void:
	velocity.x -= 1
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
	position += velocity * delta



func _on_hitbox_area_entered(_area: Area2D) -> void:
	queue_free()
