extends Panel


func game_over(score):
	visible = true
	get_node("ScoreLabel").text = "[center]" + str(score)
