extends SnakeMovementControls
class_name Snake

@onready var head: BodyPart = $Head
@onready var tail: BodyPart = head


func _ready() -> void:
	# TODO: remove
	await get_tree().process_frame
	DebugTools.set_snake_size(head, 100, Vector2(1.0, 0.0), $BodyRoot)
