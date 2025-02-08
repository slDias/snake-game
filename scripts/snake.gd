extends CharacterBody2D

class_name MainCharacter

var snake_size = 40
var direction = Vector2(1, 0)
var normal_speed = 10
var running_speed = 20
var speed = normal_speed

var head: BodyPart = null
var tail: BodyPart = null
var tail_size = 0

func _ready() -> void:
	head = $HeadSprite

func _physics_process(delta: float) -> void:
	var prev_position = self.position
	move_and_collide(direction * speed)
	head.move_tail(direction, speed)

func _input(event: InputEvent) -> void:
	if event is InputEventKey and event.pressed:
		var new_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
		
		if not new_direction.is_zero_approx():
			direction = new_direction
		
		match event.keycode:
			KEY_SPACE:
				speed = running_speed
	
	if event is InputEventKey and not event.pressed:
		match event.keycode:
			KEY_SPACE:
				speed = normal_speed

func increment_body_size() -> void:
	
	if tail_size > 10:
		return
	
	if tail == null:
		tail = head
	
	var new_tail = tail.duplicate()
	new_tail.position += (direction * -1) * (snake_size + new_tail.scale[0])
	new_tail.scale -= Vector2(0.0125, 0.0125)
	new_tail.flip_v = !new_tail.flip_v
	tail.add_next(new_tail)
	call_deferred("add_child", new_tail)
	tail = new_tail
	tail_size += 1
