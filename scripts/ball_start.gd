extends RigidBody2D

var started
var main_node
var player_node
var rigidBody

# Called when the node enters the scene tree for the first time.
func _ready():
	main_node = get_node("/root/Main")
	player_node = get_node("/root/Main/Player")
	rigidBody = get_parent()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if started:
		return
		
	#position.x = player_node.position.x
		
	if main_node.is_started():
		started = main_node.is_started()
		rigidBody.linear_velocity.y = -200
