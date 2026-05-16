extends StaticBody2D
var can_pull = false
func _process(_delta: float) -> void:
	if (Input.is_action_just_pressed("interact") and can_pull == true):
		$LeverSound.play()
		$Sprite2D.flip_v = true


func _on_interact_radius_area_entered(_area: Area2D) -> void:
	can_pull = true


func _on_interact_radius_area_exited(_area: Area2D) -> void:
	can_pull = false
