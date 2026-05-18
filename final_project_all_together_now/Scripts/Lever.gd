extends StaticBody2D

signal disable_wall

var can_pull = false
var activated = false

func _process(_delta):
	if Input.is_action_just_pressed("interact") and can_pull and not activated:
		activated = true

		$Sprite2D.flip_v = true
		$LeverSound.play()

		disable_wall.emit()

func _on_interact_radius_body_entered(body):
	if body.is_in_group("Player"):
		can_pull = true

func _on_interact_radius_body_exited(body):
	if body.is_in_group("Player"):
		can_pull = false
