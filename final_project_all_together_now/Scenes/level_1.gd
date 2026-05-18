extends Node2D

func _ready() -> void:
	$"Portal Sound".play()
func _on_lever_disable_wall() -> void:
	$platform11.queue_free()



func _on_lever_2_disable_wall() -> void:
	$platform3.queue_free()


func _on_lever_3_disable_wall() -> void:
	$platform9.queue_free()
