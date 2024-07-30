extends Node2D

#Global Variables
#Lives
var lives1 = 10
var lives2 = 10
#scores
var score1 = 0
var score2 = 0
#Players
@onready var player1 = $PlayerOne
@onready var player2 = $PlayerTwo
#UI
@onready var hud = $UI/HUD
@onready var ui = $UI
#Gameover
var game_over_scene= preload("res://scenes/game_over_screen.tscn")
var game_over

#Music
@onready var music = $Background2
@onready var mouse_sound = $MouseSound
@onready var rocket_sound = $RocketSound
@onready var cat_sound = $CatSound

func _ready():
	hud.set_score_label(0, "one")
	hud.set_score_label(0, "two")
	hud.set_lives(10, "one")
	hud.set_lives(10, "two")
	music.play()

#Removing excess mice
func _on_useless_mouse_die_area_entered(area):
	area.queue_free()

#Damage for players
func _on_player_one_took_damage(damage):
	lives1 -= damage
	hud.set_lives(lives1, "one")
	if (lives1<=0):
		player1.die()
		gameover(player2, "two", "one", score2, score1)

func _on_player_two_took_damage(damage):
	lives2 -= damage
	hud.set_lives(lives2, "two")
	if (lives2<=0):
		player2.die()
		gameover(player1, "one","two", score1, score2)



#Spawning mice
func _on_enemy_spawner_mouse_spawned(mouse_instance):
	mouse_instance.connect("died", _on_mouse_death)
	add_child(mouse_instance)

#Scores
func _on_mouse_death(player, points):
	if points == 100 || points == -50:
		mouse_sound.play()
	else:
		rocket_sound.play()
	if player == "one":
		score1+=points
		hud.set_score_label(score1, player)
	if player == "two":
		score2+=points
		hud.set_score_label(score2, player)

#After one player dies
func gameover(win, winner, loser, w_score, l_score):
	cat_sound.play()
	#Wait 0.5s for rest of code to execute
	await get_tree().create_timer(.5).timeout
	win.die()
	game_over = game_over_scene.instantiate()
	if l_score > w_score:
		game_over.set_winner(loser, l_score, w_score)
	else:
		game_over.set_winner(winner, w_score, l_score)
	ui.add_child(game_over)
	

#For the fancy mice
func _on_enemy_spawner_path_spawned(path_instance):
	add_child(path_instance)
	path_instance.mouse.connect("died", _on_mouse_death)
