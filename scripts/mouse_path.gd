extends Path2D

@onready var path = $PathFollow2D
@onready var mouse = $PathFollow2D/Mouse
# Called when the node enters the scene tree for the first time.
func _ready():
	path.set_progress_ratio(1)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	path.progress_ratio -= 0.25*delta
	if path.progress_ratio <= 0:
		queue_free()
