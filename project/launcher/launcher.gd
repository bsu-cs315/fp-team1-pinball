extends Node2D

signal game_over

@export var power := 2000.
var _current_ball : RigidBody2D = null
var _balls_left := 1

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("launch") and _balls_left > 0:
		if _current_ball == null:
			var impulse := Vector2(0,-1) * power
			_current_ball = preload("res://ball/ball.tscn").instantiate() as RigidBody2D
			get_parent().add_child(_current_ball)
			_balls_left -= 1
			_current_ball.global_position = global_position
			_current_ball.apply_impulse(impulse)
	
	if _balls_left == 0 and _current_ball == null:
		game_over.emit()
