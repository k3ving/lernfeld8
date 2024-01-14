extends HTTPRequest


func _on_request_completed(result, response_code, headers, body):
	pass
	

func post_score(score):
	request_completed.connect(_on_request_completed)
	var user = PlayerVariables.player_name
	request("http://127.0.0.1:6969/pongservice/sendscore?user=" + user + "&score=" + str(score))
