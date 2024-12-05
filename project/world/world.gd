extends Node2D

var _score : int = 0
var _current_score: int = 0
var _high_score: int = 0
@export var balls_left := 3
const HIGH_SCORE_FILE: String = "user://high_score.save"

func _process(_delta: float) -> void:
	if $Launcher.balls_left == 0 and $Launcher.ball_in_play == false:
		$GameOverLabel.show()
		await(get_tree().create_timer(20).timeout)
		get_tree().change_scene_to_file("res://Title screen/title_screen.tscn")
	$BallsLeftLabel.text = "Balls Left : %.d" % $Launcher.balls_left
	_current_score_counter()
	update_score
	


func _on_ball_kill_zone_body_entered(body: Node2D) -> void:
	if body.is_in_group("Ball"):
		body.queue_free()
		$DeathSFX.play()


func _on_launcher_zone_body_entered(body: Node2D) -> void:
	if body.is_in_group("Ball"):
		body.queue_free()
		$Launcher.balls_left += 1
		$DeathSFX.play()


func _on_score_bumper_left_update_score() -> void:
	_score += 10
	_current_score += 10
	_update_score_label()
	update_score(10)


func _on_score_bumper_right_update_score() -> void:
	_score += 10
	_current_score += 10
	_update_score_label()
	update_score(10)


func _on_score_bumper_top_update_score() -> void:
	_score += 10
	_current_score += 10
	_update_score_label()
	update_score(10)

	
func _update_score_label() -> void:
	$ScoreLabel.text = "Score : %.d" % _score

func _current_score_counter() -> void:
	if _current_score >= 300:
		$Launcher.balls_left += 1
		_current_score = 0


func _ready():
	load_high_score()
	update_score_labels()
	

func load_high_score():
	var file = FileAccess.open(HIGH_SCORE_FILE, FileAccess.READ)
	if file:
		_high_score = file.get_32()
		file.close()
	else:
		_high_score = 0
		
func update_score(points: int):
	_score += points
	if _score > _high_score:
		_high_score = _score
		save_high_score()
	update_score_labels()
	
func save_high_score():
	var file = FileAccess.open(HIGH_SCORE_FILE,FileAccess.WRITE)
	if file:
		file.store_32(_high_score)
		file.close()

		
func update_score_labels():
	$HighScoreLabel.text = "High Score: %d" % _high_score
