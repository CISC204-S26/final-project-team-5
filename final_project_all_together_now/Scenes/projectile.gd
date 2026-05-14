extends Node2D
@export var speed = 150
func _ready() -> void:
	visible = false


func _on_enemy_type_1_fire() -> void:
	visible = true

func _process(delta: float) -> void:
	var velocity = Vector2.ZERO
	if visible:
		velocity.x -= 1
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
	position += velocity * delta


func _on_area_2d_area_entered(_area: Area2D) -> void:
	queue_free()
