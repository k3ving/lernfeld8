extends Node2D

var score = 0
var started = false
var ended = false
	

func is_started():
	return started


func _process(delta):
	if Input.is_action_pressed("ui_select"):
		started = true
	if started && !ended:	
		score +=1
	if ended:
		print(score)


func end_game():
	ended = true
	print("Your final score is: ", score)
