extends Node2D

func _process(_delta: float) -> void:
	pass


func _on_detection_radius_area_entered(_area: Area2D) -> void:
	pass # Replace with function body.


func _on_hurtbox_area_entered(_area: Area2D) -> void:
	queue_free()
