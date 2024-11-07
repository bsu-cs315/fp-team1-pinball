extends CanvasLayer

func _on_play_button_pressed() -> void:
	get_tree().change_scene_to_file("res://world/world.tscn")


func _on_credits_button_pressed() -> void:
	$Credits/CreditsLabel.visible = not $Credits/CreditsLabel.visible


func _on_directions_button_pressed() -> void:
	$Directions/DirectionsLabel.visible = not $Directions/DirectionsLabel.visible
