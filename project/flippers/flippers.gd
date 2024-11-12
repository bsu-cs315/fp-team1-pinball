extends Node2D

@export var left_flipper_node: NodePath
@export var right_flipper_node: NodePath
@export var flipper_speed := .3

var left_flipper_starting_rotation: float = -0.4
var left_flipper_rotation_amount: float = 0.7

var right_flipper_starting_rotation: float = PI + 0.54
var right_flipper_rotation_amount: float = 0.7

var _left_flipper_target_rotation: float = 0.0
var _right_flipper_target_rotation: float = 0.0

var left_flipper: Node2D
var right_flipper: Node2D

func _ready() -> void:
	left_flipper = get_node(left_flipper_node)
	right_flipper = get_node(right_flipper_node)

	left_flipper.rotation = left_flipper_starting_rotation
	_left_flipper_target_rotation = left_flipper_starting_rotation

	right_flipper.rotation = right_flipper_starting_rotation
	_right_flipper_target_rotation = right_flipper_starting_rotation

func _process(_delta: float) -> void:
	if Input.is_action_pressed("right_flipper"):
		_left_flipper_target_rotation = left_flipper_starting_rotation + left_flipper_rotation_amount
	else:
		_left_flipper_target_rotation = left_flipper_starting_rotation

	left_flipper.rotation = lerp_angle(left_flipper.rotation, _left_flipper_target_rotation, flipper_speed)

	if Input.is_action_pressed("left_flipper"):
		_right_flipper_target_rotation = right_flipper_starting_rotation - right_flipper_rotation_amount
	else:
		_right_flipper_target_rotation = right_flipper_starting_rotation

	right_flipper.rotation = lerp_angle(right_flipper.rotation, _right_flipper_target_rotation, flipper_speed)
