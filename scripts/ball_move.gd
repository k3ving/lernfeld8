extends CharacterBody2D


var started
var main_node
var player_node

# Called when the node enters the scene tree for the first time.
func _ready():
	main_node = get_node("/root/Main")
	player_node = get_node("/root/Main/Player")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	started = main_node.is_started()
	
	if not started:
	
		velocity = player_node.linear_velocity
	else:
		velocity = Vector2(player_node.linear_velocity.x, -200)
		
		
func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.get_normal())

func _on_ball_body_entered(body):
	print(body.get_parent().name)
