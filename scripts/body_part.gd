extends CharacterBody2D

class_name BodyPart

@export var next: BodyPart = null

var wiggle_variant = 1
var wiggle_counter = 15
var counter = 20

func add_next(body: BodyPart) -> void:
	next = body
	

func move_tail(prev_position, speed, delta):
	var curr_position = self.position
	var body_part = self.next
	while body_part != null and counter > 0:
		var new_pos = (body_part.position + prev_position + curr_position) / 3
		print("prev", prev_position)
		print("curr", curr_position)
		print("bp", body_part.position)
		print("new", new_pos)
		print("----------------")
		prev_position = body_part.position
		curr_position = new_pos
		
		var distance = body_part.position.distance_to(new_pos)
		var d = 0.5
		if distance < 52.5:
			d = 0.12
		if distance > 57.5:
			d = .75
			
		print("dis", distance)
		print("move", ((new_pos - body_part.position) * d) * delta)
			
		# body_part.move_and_collide(((new_pos - body_part.position) * -d) * delta)
			
		body_part = body_part.next
		# counter -= 1
		
	if counter == 0:
		print("lssdkj")
