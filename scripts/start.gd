extends Control

@onready var start_music = $StartMusic

func _ready():
	start_music.play()

func _on_start_pressed():
	get_tree().change_scene_to_file("res://scenes/game.tscn")


func _on_quit_pressed():
	get_tree().quit() 
