extends Area2D


@export var target_object: Node2D

var player_near := false

func _on_body_entered(body):
	if body.is_in_group("Player"):
		player_near = true

func _on_body_exited(body):
	if body.is_in_group("Player"):
		player_near = false

func _process(delta):
	if player_near and Input.is_action_just_pressed("interact"):
		target_object.queue_free()
		print("E pressed")
