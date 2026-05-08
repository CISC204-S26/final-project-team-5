extends Sprite2D
var movement_speed=500.0
var normal_speed=500.0
var sprint_speed=800.0
var is_invisible = false 
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#pass
	#position = position + Vector2(1,0) * movement_speed * delta 

#Sprint Part
	if Input.is_action_pressed("sprint true"):
		movement_speed=sprint_speed
	else:
		movement_speed=normal_speed

#All movement in the different directions
	if Input.is_action_pressed("right"):
		position = position + Vector2(1,0) * movement_speed * delta
	if Input.is_action_pressed("left"):
		position = position + Vector2(-1,0) * movement_speed * delta
	if Input.is_action_pressed("up"):
		position = position + Vector2(0,-1) * movement_speed * delta
	if Input.is_action_pressed("down"):
		position = position + Vector2(0,1) * movement_speed * delta
