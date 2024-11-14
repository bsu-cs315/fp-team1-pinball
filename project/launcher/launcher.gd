extends Node2D

@export var ball_in_play := false
@export var balls_left := 3

var power := 1500.
var _current_ball : RigidBody2D = null
var rng = RandomNumberGenerator.new()

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("launch") and balls_left > 0:
		if _current_ball == null:
			power = rng.randf_range(1500,1600)
			var impulse := Vector2(0,-1) * power
			_current_ball = preload("res://ball/ball.tscn").instantiate() as RigidBody2D
			get_parent().add_child(_current_ball)
			ball_in_play = true
			balls_left -= 1
			_current_ball.global_position = global_position
			_current_ball.apply_impulse(impulse)
	
	if _current_ball == null:
		ball_in_play = false
