extends Node2D
class_name SnakeMovementControls

@export var default_speed = 500.0
@export var running_speed = 20.0

var movement_vector = Vector2(0.0, -1.0)
var current_speed = default_speed
@onready var character = $Head


func _input(event: InputEvent) -> void:
	_handle_direction_input(event)
	_handle_speed_input(event)


func _physics_process(_delta: float) -> void:
	character.move(movement_vector * current_speed)


func _handle_direction_input(_event: InputEvent) -> void:
	var new_movement_vector = Input.get_vector(
		"ui_left", "ui_right", "ui_up", "ui_down"
	)
	
	if not new_movement_vector.is_zero_approx():
		movement_vector = new_movement_vector


func _handle_speed_input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_select"):
		set_running(true)
	if Input.is_action_just_released("ui_select"):
		set_running(false)


func set_running(value: bool) -> void:
	if value == true:
		current_speed = running_speed
	else:
		current_speed = default_speed
