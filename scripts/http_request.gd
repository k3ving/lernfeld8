extends HTTPRequest
	
	
func _on_request_completed(result, response_code, headers, body):
	var json = JSON.parse_string(body.get_string_from_utf8())
	print(json)


func _on_button_button_down():
	request_completed.connect(_on_request_completed)
	request("http://127.0.0.1:6969/pongservice/hello")
