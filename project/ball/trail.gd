extends Line2D

@export var _length = 15
var _point = Vector2()

func _process(_delta: float) -> void:
	global_position = Vector2(0,0)
	global_rotation = 0
	
	_point = get_parent().global_position
	add_point(_point)
	while get_point_count() > _length :
		remove_point(0) 
