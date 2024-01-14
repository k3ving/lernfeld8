extends RigidBody2D

<<<<<<< HEAD

=======
var velocity = 0
var speed = 0
# Called when the node enters the scene tree for the first time.
>>>>>>> c08902d (implement unit tests(move and exist))
func _ready():
	pass # Replace with function body.


func _process(delta):
<<<<<<< HEAD
	var velocity = 300
	var speed = 0
=======
>>>>>>> c08902d (implement unit tests(move and exist))
	
	if Input.is_action_pressed("ui_left") or Input.is_key_pressed(KEY_A):
		speed += -velocity
	if Input.is_action_pressed("ui_right") or Input.is_key_pressed(KEY_D):
		speed += velocity
	
	linear_velocity.x = speed

func get_speed():
	return speed
	
func set_speed(speedp):
	speed = speedp
