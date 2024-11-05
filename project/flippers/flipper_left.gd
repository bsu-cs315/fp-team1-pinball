extends Node2D

var starting_rotation = PI + 0.54  # Mirrors the initial rotation
var rotation_amount = -0.7  # Defines the upward rotation range
var target_rotation = 0.0

func _ready() -> void:
	rotation = starting_rotation
	target_rotation = starting_rotation

func _process(delta: float) -> void:
	if Input.is_action_pressed("left_flipper"):
		# Adjust to rotate upwards from the mirrored starting position
		target_rotation = starting_rotation + rotation_amount
	else:
		# Return to mirrored starting position when not pressed
		target_rotation = starting_rotation

	# Smoothly interpolate to target rotation
	rotation = lerp_angle(rotation, target_rotation, 0.3)
