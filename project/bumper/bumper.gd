extends Area2D


func _on_body_entered(body: Node2D) -> void:
	$BumperSprite.play("bumper_flash")
	print("BUMPER HIT")


func _on_bumper_sprite_animation_looped() -> void:
	$BumperSprite.play("default")
