extends Control

var http_node
var scoreboard


func _ready():
	http_node = get_node("HTTPRequest")
	scoreboard = get_node("HBoxContainer/MarginContainer/VBoxContainer/ScrollContainer/Scoreboard")
	
	get_node("/root/Control/UserLabel").text = \
		"User: " + PlayerVariables.player_name
		
	http_node.get_scores(PlayerVariables.player_name,\
		Callable(self, "display_scores"), Callable(self, "display_own_score"))


func _process(delta):
	pass
	
	
func display_scores(scores):
	if not scores:
		return
		
	scores = str_to_var(scores)
	for i in range(scores.size()):
		var score_instance = preload("res://scenes/score.tscn").instantiate()
		score_instance.instantiate(str(i + 1) + ". " + scores[i][0] + ": " + str(scores[i][1]))
		scoreboard.add_child(score_instance)
		

func display_own_score(score):
	score = str_to_var(score)
	
	if typeof(score) == TYPE_NIL:
		score = [0, 0]
	
	var score_instance = preload("res://scenes/score.tscn").instantiate()
	score_instance.instantiate("[b][font_size=35]Own Highscore: " + str(score[1]))
	get_node("HBoxContainer/MarginContainer/VBoxContainer").add_child(score_instance)
	

func quit_game():
	get_tree().quit()
	
	
func start_game():
	get_tree().change_scene_to_file("res://scenes/game_scene.tscn")
	
func logout():
	PlayerVariables.player_name = ""
	get_tree().change_scene_to_file("res://scenes/login_menu.tscn")
