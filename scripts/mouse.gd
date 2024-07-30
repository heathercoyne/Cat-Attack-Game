extends Area2D

#signals
signal died(player, points)

#Global Variables
@export var speed = 225
var rocket_scene = preload("res://scenes/rocket.tscn")
@onready var rocket_container = $MouseRocketContainer
@onready var ammo_timer = $Timer
@onready var sound = $MouseShoot
# Called when the node enters the scene tree for the first time.
func _ready():
	ammo_timer.connect("timeout", _on_timeout)

func _physics_process(delta):
	global_position.x += -speed*delta

#Shoot Mouse Rockets
func _on_timeout():
	sound.play()
	var rocket_instance = rocket_scene.instantiate()
	rocket_container.add_child(rocket_instance)
	rocket_instance.add_ammo()
	rocket_instance.global_position = global_position 
	rocket_instance.global_position.x -= 75
	rocket_instance.connect("shot", _on_shot)

#Verify I am a mouse
func check_mouse():
	return true

#Enemy dies	
func die(player, points, delete):
	if delete:
		queue_free()
	emit_signal("died", player, points)

#Checking for hitting player
func _on_body_entered(body):
	die(body.determine_player(), -50, true)
	body.take_damage(3)
	
#When shot (by) a bullet
func _on_shot(player, points):
	die(player, points, false)

