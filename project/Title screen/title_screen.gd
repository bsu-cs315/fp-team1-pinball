extends CanvasLayer

const HIGH_SCORE_FILE: String = "res://high_score.save"


func _ready() -> void:
	load_and_display_high_score()
	

func _on_play_button_pressed() -> void:
	get_tree().change_scene_to_file("res://world/world.tscn")


func _on_credits_button_pressed() -> void:
	$Credits/CreditsLabel.visible = not $Credits/CreditsLabel.visible
	$Directions/DirectionsLabel.visible = false


func _on_directions_button_pressed() -> void:
	$Directions/DirectionsLabel.visible = not $Directions/DirectionsLabel.visible
	$Credits/CreditsLabel.visible = false


func _on_music_finished() -> void:
	$Music.play()


func load_and_display_high_score() -> void:
	var high_score = load_high_score()
	$HighScoreLabel.text = "High Score: %d" % high_score
	
func load_high_score() -> int:
	var file = FileAccess.open(HIGH_SCORE_FILE, FileAccess.READ)
	if file:
		var high_score = file.get_32()
		file.close()
		return high_score
	return 0
