extends HTTPRequest

var _own_score_callback
var _scores_callback
var _user


func get_scores(user, scores_callback, own_score_callback):
	_scores_callback = scores_callback
	_own_score_callback = own_score_callback
	_user = user
	
	request_completed.connect(_on_scores_request_completed)
	request("http://127.0.0.1:6969/pongservice/gethighscores")


func _on_scores_request_completed(result, response_code, headers, body):
	var response = body.get_string_from_utf8()
	_scores_callback.call(response)
	request_completed.disconnect(_on_scores_request_completed)
	
	request_completed.connect(_on_own_score_request_completed)
	request("http://127.0.0.1:6969/pongservice/getownscore?user=" + _user)
	
	
func _on_own_score_request_completed(result, response_code, headers, body):
	var response = body.get_string_from_utf8()
	_own_score_callback.call(response)
	request_completed.disconnect(_on_own_score_request_completed)
