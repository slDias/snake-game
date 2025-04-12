extends Node
class_name DebugTools


static func set_snake_size(
	snake_head: BodyPart, size: int, dir: Vector2, root: Node
) -> BodyPart:
	var body_part_cursor = snake_head
	var offset = (-dir * snake_head.size) + (-dir * 4)
	for i in range(0, size, 1):
		var new_body_part = body_part_cursor.duplicate()
		new_body_part.name = 'body_part_' + str(i)
		new_body_part.position += offset
		body_part_cursor.append(new_body_part)
		body_part_cursor = body_part_cursor.next_body_part
		root.add_child.call_deferred(body_part_cursor)
		
		
	while false and body_part_cursor != null:
		var prev = body_part_cursor.previous_body_part
		while prev != null:
			body_part_cursor.add_collision_exception_with(prev)
			prev = prev.previous_body_part
		body_part_cursor = body_part_cursor.previous_body_part
		
	return body_part_cursor
