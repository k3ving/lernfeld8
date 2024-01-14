extends CharacterBody2D


var started
var ended
var main_node
var player_node
var speed = -200


func _ready():
	main_node = get_node("/root/Main")
	player_node = get_node("/root/Main/Player")


func _process(delta):
	if not started:
		position.x = player_node.position.x
		started = main_node.is_started()
		if started:
			velocity = Vector2(player_node.linear_velocity.x, speed)
	if ended:
		queue_free()
		
		
func _physics_process(delta):
	if not main_node.ended:
		var collision = move_and_collide(velocity * delta)
		if collision:
			var collider_name = collision.get_collider().name
			if (collider_name == "EndWall"):
				main_node.end_game()
			if (collider_name == "Player"):
				main_node.add_score()
				if velocity.length() < 1000:
					velocity *= 1.1
			velocity = velocity.bounce(collision.get_normal())
	else:
		ended = main_node.ended

			
func get_speed():
	return speed
	
func set_speed(speedp):
	speed = speedp 
