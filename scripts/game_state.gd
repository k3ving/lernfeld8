extends Node2D

var score = 0
var iteration = 0
var started = false
var ended = false
var scoreLabel
	

func _ready():
	scoreLabel = get_node("ScoreLabel")


func is_started():
	return started


func _process(delta):
	if Input.is_action_pressed("ui_select"):
		started = true
		

func add_score():
	iteration += 1
	score += 100 * iteration
	scoreLabel.text = "[center]" + str(score)


func end_game():
	ended = true
	print("Your final score is: ", score)
	get_node("GameOverScreen").game_over(score)
	get_node("HTTPRequest").post_score(score)
	

func restart():
	get_tree().reload_current_scene()
	
	
func quit_to_main():
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
