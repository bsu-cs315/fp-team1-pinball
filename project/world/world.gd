extends Node2D

func _on_ball_kill_zone_body_entered(_body: Node2D) -> void:
	_body.queue_free()


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://world/world.tscn")


func _on_launcher_game_over() -> void:
	$RestartButton.show()
