extends Area2D

class_name Apple


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	connect("body_entered", _on_body_entered)


func _on_body_entered(body: Node2D):
	if body is MainCharacter:
		var viewport = get_viewport()
		var visible_rect = viewport.get_visible_rect()
		
		var rng = RandomNumberGenerator.new()
		rng.randomize()

		var x = rng.randf_range(visible_rect.position.x + 50, visible_rect.position.x + visible_rect.size.x - 50)
		var y = rng.randf_range(visible_rect.position.y + 50, visible_rect.position.y + visible_rect.size.y - 50)
		
		var new_apple = self.duplicate()
		new_apple.position = Vector2(x, y)
		get_parent().call_deferred("add_child", new_apple)
		call_deferred("free")
		body.call_deferred("increment_body_size")
