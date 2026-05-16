extends Node

# Stores collected items using unique IDs
var collected_items: Dictionary = {}

func is_collected(id: String) -> bool:
	return collected_items.has(id)

func collect(id: String) -> void:
	collected_items[id] = true

func reset():
	collected_items.clear()
