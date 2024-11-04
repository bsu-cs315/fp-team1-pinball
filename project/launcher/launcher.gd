extends Node2D

@export var power := 2000.
var _current_ball : RigidBody2D = null

func _process(delta: float) -> void:

	if Input.is_action_just_pressed("launch"):
		if _current_ball == null:
			var impulse := Vector2(0,-1) * power
			_current_ball = preload("res://ball/ball.tscn").instantiate() as RigidBody2D
			get_parent().add_child(_current_ball)
			_current_ball.global_position = global_position
			_current_ball.apply_impulse(impulse)
