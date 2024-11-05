extends RigidBody2D






func _on_body_entered(_body: Node) -> void:
	var collider = get_colliding_bodies()
	print(collider)
	
	
	
	
