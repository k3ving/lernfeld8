extends RigidBody2D


func _ready():
	pass # Replace with function body.


func _process(delta):
	var velocity = 300
	var speed = 0
	
	if Input.is_action_pressed("ui_left") or Input.is_key_pressed(KEY_A):
		speed += -velocity
	if Input.is_action_pressed("ui_right") or Input.is_key_pressed(KEY_D):
		speed += velocity
	
	linear_velocity.x = speed
