extends Node2D


var started = false
	

func is_started():
	return started


func _process(delta):
	if Input.is_action_pressed("ui_select"):
		started = true
