extends CharacterBody2D


var main_node
var ball
var ball_speed
var speed = 300

func _ready():
	main_node = get_node("/root/Main")
	ball = get_node("/root/Main/Ball")


func _process(delta):
	if not main_node.started or main_node.ended:
		return
		
	ball_speed = ball.velocity.x
	
	if position.x > ball.position.x:
		print("Pos: " + str(position.x) + "Ball Pos: " + str(ball.position.x))
		move_and_collide(Vector2(-1 * abs(ball.velocity.x), 0) * delta)
	elif position.x < ball.position.x:
		print("Pos: " + str(position.x) + "Ball Pos: " + str(ball.position.x))
		move_and_collide(Vector2(1 * abs(ball.velocity.x), 0) * delta)
