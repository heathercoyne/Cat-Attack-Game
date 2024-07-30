extends Control

func set_winner(player, winner_score, loser_score):
	if player == "one":
		$Background/Winner.text = "PLAYER 1 WINS\nScore: " + str(winner_score)
		$Background/Loser.text = "Player 2 Score: " + str(loser_score)
	else:
		$Background/Winner.text = "PLAYER 2 WINS\nScore: " + str(winner_score)
		$Background/Loser.text = "Payer 1 Score: " + str(loser_score)


func _on_rematch_pressed():
	get_tree().reload_current_scene()

func _on_back_to_start_pressed():
	get_tree().change_scene_to_file("res://scenes/start.tscn")
