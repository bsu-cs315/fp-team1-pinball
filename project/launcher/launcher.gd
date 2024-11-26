extends Node2D

@export var ball_in_play := false
@export var balls_left := 3

var power := 1500.0
@export var min_power := 1400.0
@export var max_power := 1800.0
var power_charge_rate := 500.0 
var _current_ball: RigidBody2D = null
var rng = RandomNumberGenerator.new()

var charging_power := false
var current_charge_time := 0.0

var vslider: VSlider 

func _ready() -> void:
	set_process(true)
	set_process_internal(true)
	vslider = $VSlider 
	vslider.min_value = min_power
	vslider.max_value = max_power
	vslider.value = power

func _process(_delta: float) -> void:
	if Input.is_action_pressed("launch") and balls_left > 0:
		charging_power = true
		current_charge_time += _delta
		power = lerp(
			min_power,
			max_power,
			min(current_charge_time * power_charge_rate / (max_power - min_power), 1.0)
		)
		vslider.value = power 
	elif Input.is_action_just_released("launch") and charging_power:
		charging_power = false
		launch_ball()
		current_charge_time = 0.0
		vslider.value = min_power  

	if _current_ball == null:
		ball_in_play = false

func launch_ball() -> void:
	if _current_ball == null:
		var impulse := Vector2(0, -1) * power
		_current_ball = preload("res://ball/ball.tscn").instantiate() as RigidBody2D
		get_parent().add_child(_current_ball)
		ball_in_play = true
		balls_left -= 1
		_current_ball.global_position = global_position
		_current_ball.apply_impulse(impulse)
