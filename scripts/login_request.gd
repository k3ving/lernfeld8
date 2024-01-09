extends HTTPRequest

var username_input
var password_input

func _ready():
	username_input = get_node("/root/Control/VBoxContainer/MarginContainer/UsernameInput")
	password_input = get_node("/root/Control/VBoxContainer/MarginContainer2/PasswordInput")

func _on_request_completed(result, response_code, headers, body):
	var response = body.get_string_from_utf8()
	# var json = JSON.parse_string(body.get_string_from_utf8())
	print(response)


func _on_button_button_down():
	if not username_input.text or not password_input.text:
		return
	
	request_completed.connect(_on_request_completed)
	request("http://127.0.0.1:6969/pongservice/login?user=" + username_input.text + "&password=" + password_input.text)
