extends Node


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_pause"):
		get_tree().paused = !get_tree().paused
