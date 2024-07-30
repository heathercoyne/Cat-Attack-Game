extends Area2D

#Signals
signal shot(player, points)

#global variables
@export var speed = 300
@onready var visible_notifier = $VisibleNotifier
@onready var rocket_texture = $Sprite2D
#determining whose rocket
var is_player2_rocket = false
var is_mouse_rocket = false

func _ready():
	visible_notifier.connect("screen_exited", _exited)

func _physics_process(delta):
	global_position.x += speed*delta #multiplying by delta to stop speed in frame and instead by second

#Removing excess rockets
func _exited():
	queue_free()

#Changing the texture 
#For player 2
func change_texture():
	var new_texture = preload("res://assets/rocket2.png")
	rocket_texture.texture = new_texture
	#determining whose rocket 
	is_player2_rocket = true
	
#For mice
func add_ammo():
	var new_texture = preload("res://assets/ammo.png")	
	rocket_texture.texture = new_texture
	speed = -speed
	is_mouse_rocket = true
	
func check_mouse():
	return false

func check_player2():
	return is_player2_rocket

#For shots
func shoot(player, points):
	emit_signal("shot", player, points)

#Checking for rocket contacts
func _on_area_entered(area):
	if area.check_mouse():
		if !is_mouse_rocket:
			queue_free()
			if is_player2_rocket:
				area.die("two", 100, true)
			else:
				area.die("one", 100, true)
	else:
		queue_free()
		if area.check_player2():
			shoot("two", 10)
		else:
			shoot("one", 10)
func _on_body_entered(body):
	shoot(body.determine_player(), -5)
	body.take_damage(1)
	queue_free()
