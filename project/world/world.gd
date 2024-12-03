extends Node2D

var _score : int = 0
var _current_score: int = 0
@export var balls_left := 3

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


func _on_launcher_zone_body_entered(body: Node2D) -> void:
	if body.is_in_group("Ball"):
		body.queue_free()
		$Launcher.balls_left += 1
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


func _on_score_bumper_left_update_score() -> void:
	_score += 10
	_current_score += 10
	_update_score_label()


func _on_score_bumper_right_update_score() -> void:
	_score += 10
	_current_score += 10
	_update_score_label()


func _on_score_bumper_top_update_score() -> void:
	_score += 10
	_current_score += 10
	_update_score_label()

	
func _update_score_label() -> void:
	$ScoreLabel.text = "Score : %.d" % _score

func _current_score_counter() -> void:
	if _current_score >= 300:
		$Launcher.balls_left += 1
		_current_score = 0
