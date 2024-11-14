extends RigidBody2D




func _on_body_entered(_body: Node) -> void:
	$Ball_sfx.play()
