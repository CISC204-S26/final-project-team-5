extends Node2D
var firing = true
signal fire
func _process(_delta: float) -> void:
	if firing:
		_throw_projectile()


func _on_detection_radius_area_entered(_area: Area2D) -> void:
	firing = true


func _on_hurtbox_area_entered(_area: Area2D) -> void:
	queue_free()

func _throw_projectile() -> void:
	await get_tree().create_timer(4).timeout
	fire.emit()


func _on_detection_radius_area_exited(_area: Area2D) -> void:
	firing = false
