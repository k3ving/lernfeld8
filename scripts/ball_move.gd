extends Node


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
	started = main_node.is_started()
	
	if not started:
		rigidBody.linear_velocity.x = player_node.linear_velocity.x
	else:
		rigidBody.linear_velocity.y = -200


func _on_body_entered(body):
	print(body.get_parent().name)
