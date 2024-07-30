extends Control

@onready var score1 = $Score1
@onready var score2 = $Score2
@onready var lives1 = $Lives1Left
@onready var lives2 = $Lives2Left

#Updating scores for each player
func set_score_label(new_score, player):
	if player=="one":
		score1.text = "Player 1 | Score: " + str(new_score)
	else:
		score2.text = "Player 2 | Score: " + str(new_score)

func set_lives(amount, player):
	if player=="one":
		lives1.text = ": " + str(amount)
	else:
		lives2.text = ": " + str(amount) 
		
