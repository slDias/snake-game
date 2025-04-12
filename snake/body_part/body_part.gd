extends CharacterBody2D
class_name BodyPart

var previous_body_part: BodyPart = null
var next_body_part: BodyPart = null
@onready var size: float = $Polygon2D.polygon[0].length_squared() / 10

var wiggle_variant = 1
var wiggle_counter = 12

func append(body_part: BodyPart) -> void:
	next_body_part = body_part
	body_part.previous_body_part = self


func add_wiggle(direction: Vector2) -> Vector2:
	wiggle_counter -= 1
	if wiggle_counter == 0:
		wiggle_counter = 12
		wiggle_variant = wiggle_variant * -1
	var wiggle_dir = direction.rotated(90.0 * wiggle_variant) / 25
	return direction + wiggle_dir


func move(direction: Vector2) -> KinematicCollision2D:
	
	var direction_wiggly = direction
	if previous_body_part != null:
		direction_wiggly = add_wiggle(direction)
	
	var result = move_and_collide(direction_wiggly)
	if next_body_part:
		var bp_dir = position - next_body_part.position
		var dist = next_body_part.position.distance_squared_to(position)
		var bp_dir_len = max((dist - 400.0) / 100.0, .175)
		next_body_part.move(bp_dir.normalized() * bp_dir_len)
	return result
