extends CanvasLayer
signal start_game
var score = -1

func _on_start_game_button_pressed():
	$StartGameButton.hide()
	$Message.text = ""
	print("start button hit")
	start_game.emit()
	$ScoreTimer.start()

func show_game_over():
	$ScoreTimer.stop()
	$MessageTimer.start()
	$Message.text = "Game Over"


func _on_message_timer_timeout():
	$Message.text = "Flappy Bird"
	score = 0
	$ScoreLabel.text = "0"
	$StartGameButton.show()
	$MessageTimer.stop()


func _on_score_timer_timeout():
	score = score + 1
	$ScoreLabel.text = str(score)
	
