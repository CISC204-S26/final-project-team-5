extends StaticBody2D
var can_pull = false
signal disable_wall
func _process(_delta: float) -> void:
	if (Input.is_action_just_pressed("interact") and can_pull == true):
		$LeverSound.play()
		$Sprite2D.flip_v = true
		disable_wall.emit()


func _on_interact_radius_area_entered(_area: Area2D) -> void:
	can_pull = true


func _on_interact_radius_area_exited(_area: Area2D) -> void:
	can_pull = false
