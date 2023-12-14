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
	
	if not started:
		velocity = player_node.linear_velocity
		started = main_node.is_started()
		if started:
			velocity = Vector2(player_node.linear_velocity.x, -200)
		
		
func _physics_process(delta):
	if not main_node.ended:
		var collision = move_and_collide(velocity * delta)
		if collision:
			if (collision.get_collider().to_string() == "EndWall:<StaticBody2D#24847058140>"):
				main_node.end_game()
			velocity = velocity.bounce(collision.get_normal())
