extends Sprite2D

class_name BodyPart

@export var next: BodyPart = null

var wiggle_variant = 1
var wiggle_counter = 15


func add_next(body: BodyPart) -> void:
	next = body

func move_tail(direction, speed):
	if next == null:
		return

	var wiggle = wiggle_variant * (direction.rotated(deg_to_rad(90)) * (speed/8))
	wiggle_counter -= 1
	if wiggle_counter == 0:
		wiggle_variant *= -1
		wiggle_counter = 15
		
	var prev_position = (direction * -1) * 50
	var body_part = next
	var d = 4.0
	while body_part != null:
		# prev_position += wiggle
		var old_pos = body_part.position
		body_part.position += (prev_position - body_part.position) / d
		body_part.position += wiggle
		prev_position = old_pos
		prev_position += (direction * -1) * 50
		d += 0.5
		body_part = body_part.next
