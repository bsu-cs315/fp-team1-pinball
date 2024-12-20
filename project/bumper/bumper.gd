extends RigidBody2D

signal updateScore

func _on_bumper_sprite_animation_looped() -> void:
	$BumperSprite.play("default")


func _on_body_entered(_body: Node) -> void:
	$BumperSprite.play("bumper_flash")
	play_audio()
	updateScore.emit()


func play_audio() -> void:
	if $BumperSFX.finished:
		$BumperSFX.play()
