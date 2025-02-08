extends Node

func _input(event: InputEvent) -> void:
	if event is InputEventKey and event.pressed:
		
		match event.keycode:
			KEY_P:
				get_tree().paused = not get_tree().paused
