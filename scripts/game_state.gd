extends Node2D

var score = 0
var started = false
	

func is_started():
	return started


func _process(delta):
	if Input.is_action_pressed("ui_select"):
		started = true
	if started:	
		score +=1
		print(score)
