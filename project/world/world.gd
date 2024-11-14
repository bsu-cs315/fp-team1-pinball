extends Node2D

func _ready() -> void:
	$MusicLoopOne.play()
	
	
func _process(_delta: float) -> void:
	if $Launcher.balls_left == 0 and $Launcher.ball_in_play == false:
		$GameOverLabel.show()
		await(get_tree().create_timer(20).timeout)
		get_tree().change_scene_to_file("res://Title screen/title_screen.tscn")
		
	$BallsLeftLabel.text = "Balls Left : %.d" % $Launcher.balls_left
	
	


	
func _on_ball_kill_zone_body_entered(body: Node2D) -> void:
	if body.is_in_group("Ball"):
		body.queue_free()
		$DeathSFX.play()
	


func _on_music_loop_one_finished() -> void:
	$MusicLoopTwo.play()
	$MusicLoopOne.stop()


func _on_music_loop_three_finished() -> void:
	$MusicLoopFull.play()
	$MusicLoopTwo.stop()


func _on_music_loop_two_finished() -> void:
	$MusicLoopThree.play()
	$MusicLoopTwo.stop()
