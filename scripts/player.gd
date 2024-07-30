extends CharacterBody2D

#Creating signal for game use
signal took_damage(damage: int)

#global variables
#Movement and Speed
var right
var left
var up
var down
var speed = 300
#Determining player 1 or 2
var shooter
#Additional
var rocket_scene = preload("res://scenes/rocket.tscn")
@onready var rocket_container = $RocketContainer
@onready var sound = $RocketSound

#Movement
func _physics_process(delta):
	velocity = Vector2(0,0)
	if Input.is_action_pressed(right):
		velocity.x = speed
	if Input.is_action_pressed(left):
		velocity.x = -speed
	if Input.is_action_pressed(up):
		velocity.y = -speed
	if Input.is_action_pressed(down):
		velocity.y = speed
	move_and_slide()
	#Restrictions
	var screen_size = get_viewport_rect().size
	global_position = global_position.clamp(Vector2(0,0), screen_size)

func _process(delta):
	if Input.is_action_just_pressed(shooter):
		shoot()
	
#Shooting Rockets	
func shoot():
	sound.play()
	var rocket_instance = rocket_scene.instantiate()
	rocket_container.add_child(rocket_instance)
	if shooter == "two":
		rocket_instance.change_texture()
	rocket_instance.global_position = global_position 
	rocket_instance.global_position.x += 75
	
#Taking Damage for players
func take_damage(damage):
	took_damage.emit(damage)
	
#Killing players
func die():
	queue_free()

#Determining the player
func determine_player():
	return shooter
