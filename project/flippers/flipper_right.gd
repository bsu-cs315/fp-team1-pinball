extends Node2D

var _starting_rotation = -0.4
var _rotation_amount = -0.7  
var _target_rotation = 0.0

func _ready() -> void:
	rotation = _starting_rotation
	_target_rotation = _starting_rotation

func _process(_delta: float) -> void:
	if Input.is_action_pressed("right_flipper"):
		_target_rotation = _starting_rotation - _rotation_amount
	else:
		_target_rotation = _starting_rotation

	rotation = lerp_angle(rotation, _target_rotation, 0.3)
