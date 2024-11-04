extends Node2D


func _on_ball_kill_zone_body_entered(_body: Node2D) -> void:
	_body.queue_free()
