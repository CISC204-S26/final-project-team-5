extends Button

func _ready():
	mouse_entered.connect(_on_hover)
	mouse_exited.connect(_on_exit)
	pressed.connect(_on_pressed)


func _on_hover():
	modulate = Color. DARK_CYAN


func _on_exit():
	modulate = Color.WHITE    


func _on_pressed():
	get_tree().change_scene_to_file("res://Controls.tscn")
