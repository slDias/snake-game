extends BodyPart

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
	head = self
	tail = head
	
	# test only
	# for i in range(15):
		# self.increment_body_size()

func _process(delta: float) -> void:
	var new_direction = Vector2(Vector2.ZERO)
	
	if Input.is_action_pressed('ui_right'):
		new_direction.x += 1
	elif Input.is_action_pressed('ui_left'):
		new_direction.x -= 1
	elif Input.is_action_pressed('ui_down'):
		new_direction.y += 1
	elif Input.is_action_pressed('ui_up'):
		new_direction.y -= 1
		
	var stopped = new_direction.is_zero_approx()
	var reversal = (new_direction - (direction * -1)).is_zero_approx()
	
	if not stopped and not reversal:
		direction = new_direction
	
	if Input.is_action_just_pressed("space"):
		speed = running_speed
	
	if Input.is_action_just_released("space"):
		speed = normal_speed

func _physics_process(delta: float) -> void:
	var prev_position = self.position
	move_and_collide(direction * speed)
	# self.move_tail(prev_position, speed, delta)

func increment_body_size() -> void:
	
	if tail_size >= 15:
		return
	
	var new_position = tail.global_position if tail == head else tail.position
	# var new_tail = tail.duplicate()
	var new_tail = BodyPart.new()
	new_tail.add_child(tail.get_children()[0].duplicate())
	# new_tail.position = new_position - (snake_size * direction)
	new_tail.position = Vector2(365.0, 365.0)
	new_tail.scale = tail.scale - Vector2(0.0125, 0.0125)
	new_tail.add_collision_exception_with(tail)
	tail.add_next(new_tail)
	get_tree().get_root().call_deferred("add_child", new_tail)
	tail = new_tail
	tail_size += 1


# design ideas

# have swingin traps that can cut the player in half. forcing it to go faster through a segment
# instead of apples have rat/rodents that walk or run around
# have an enemy that runs after the player
# have loops that allow the player to time a movement (player can go around and around until the timing for something is perfect)
#  - if the player bits its tail it dies (can be used to limit the player looping if needed)
# pressure plates that can open close doors or other interactivity
# 
