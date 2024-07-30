extends Node2D

#signals
signal mouse_spawned(mouse_instance)
signal path_spawned(path_instance)

#Global Variables
@onready var spawn_timer = $Timer
@onready var pathed_spawn_timer = $PathedMouseTimer1
@onready var speed_timer = $SpeedUpTImer
var mouse_scene = preload("res://scenes/mouse.tscn")
var path1 = preload("res://scenes/mouse_path1.tscn")
var path2 = preload("res://scenes/mouse_path2.tscn")
var path3 = preload("res://scenes/mouse_path3.tscn")

#Starting Wait Times
var normal_time = 7
var hard_time = 12
var speed_time = 20

# Called when the node enters the scene tree for the first time.
func _ready():
	spawn_timer.connect("timeout", _on_timeout)
	update_time(normal_time, hard_time, speed_time)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

#Spawn the mice after timeout
func _on_timeout():
	spawn_enemy()

#Randomly spawns mice enemies
func spawn_enemy():
	var mouse_instance = mouse_scene.instantiate()
	var screen_size = get_viewport_rect().size
	var mouse_position = randi_range(50, screen_size.y-40)
	mouse_instance.global_position = Vector2(screen_size.x+70, mouse_position)
	emit_signal("mouse_spawned", mouse_instance)

#randomly picks a pathed mouse
func _on_pathed_mouse_timer_1_timeout():
	var random_path = randi_range(1, 3)
	var path_instance
	if random_path ==1:
		path_instance = path1.instantiate()
	elif random_path ==2:
		path_instance = path2.instantiate()
	else:
		path_instance = path3.instantiate()
	emit_signal("path_spawned", path_instance)

#For making the game progressively harder
func _on_speed_up_t_imer_timeout():
	var n_time = spawn_timer.get_wait_time()
	var h_time = pathed_spawn_timer.get_wait_time()
	var s_time = speed_timer.get_wait_time()
	if s_time >= 1:
		s_time -=0.5
	if n_time >= 0.5:
		n_time-=0.4
	if h_time >=1:
		h_time -=0.3
	if n_time <0.5 && h_time< 1.0:
		speed_timer.stop()
	update_time(n_time, h_time, s_time)

func update_time(n_time, h_time, s_time):
	spawn_timer.set_wait_time(n_time)
	pathed_spawn_timer.set_wait_time(h_time)
	speed_timer.set_wait_time(s_time)

