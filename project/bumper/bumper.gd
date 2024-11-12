extends RigidBody2D


func _on_bumper_sprite_animation_looped() -> void:
	$BumperSprite.play("default")


func _on_body_entered(_body: Node) -> void:
	$BumperSprite.play("bumper_flash")
