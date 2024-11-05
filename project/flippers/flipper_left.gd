extends Node2D

var starting_rotation = PI + 0.54 
var rotation_amount = -0.7 
var target_rotation = 0.0

func _ready() -> void:
	rotation = starting_rotation
	target_rotation = starting_rotation

func _process(_delta: float) -> void:
	if Input.is_action_pressed("left_flipper"):
		target_rotation = starting_rotation + rotation_amount
	else:
		target_rotation = starting_rotation
	rotation = lerp_angle(rotation, target_rotation, 0.3)
