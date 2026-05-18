extends Area2D

@export_file var NEXT_LEVEL: String = ""



func _on_body_entered(body):
	if body.is_in_group("Player") and NEXT_LEVEL !="":
		get_tree().change_scene_to_file(NEXT_LEVEL)
