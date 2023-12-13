extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = 200
	var speed = 0
	
	if Input.is_action_pressed("ui_left"):
		speed += -velocity
	if Input.is_action_pressed("ui_right"):
		speed += velocity
	
	linear_velocity.x = speed
