extends Area2D


@export_file var NEXT_LEVEL: String = ""

var players_in_portal := 0

func _on_body_entered(body):
	if body.is_in_group("Player"):
		players_in_portal += 1
		print(players_in_portal)

		if players_in_portal >= 2 and NEXT_LEVEL != "":
			get_tree().change_scene_to_file(NEXT_LEVEL)




func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"):
		players_in_portal -= 1
