extends Area2D

@export_file var NEXT_LEVEL: String

var players_in_portal := []

func _on_body_entered(body):
	if body.is_in_group("Player") and not players_in_portal.has(body):
		players_in_portal.append(body)

		print(players_in_portal.size())

		if players_in_portal.size() <= 2:
			print("Loading:", NEXT_LEVEL)
			get_tree().change_scene_to_file(NEXT_LEVEL)

func _on_body_exited(body):
	if players_in_portal.has(body):
		players_in_portal.erase(body)
