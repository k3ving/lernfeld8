extends CharacterBody2D


var started
var main_node
var player_node
var speed = -200

# Called when the node enters the scene tree for the first time.
func _ready():
	main_node = get_node("/root/Main")
	player_node = get_node("/root/Main/Player")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not started:
		position.x = player_node.position.x
		started = main_node.is_started()
		if started:
			velocity = Vector2(player_node.linear_velocity.x, speed)
		
		
func _physics_process(delta):
	if not main_node.ended:
		var collision = move_and_collide(velocity * delta)
		if collision:
			var collider_name = collision.get_collider().name
			if (collider_name == "EndWall"):
				main_node.end_game()
			if (collider_name == "Player"):
				main_node.add_score()
				velocity *= 1.1
			velocity = velocity.bounce(collision.get_normal())
