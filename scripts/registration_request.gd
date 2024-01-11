extends HTTPRequest

var username_input
var password_input
var password_confirm_input
var error_label

func _ready():
	username_input = get_node("/root/Control/VBoxContainer/MarginContainer/UsernameInput")
	password_input = get_node("/root/Control/VBoxContainer/MarginContainer2/PasswordInput")
	password_confirm_input = get_node("/root/Control/VBoxContainer/MarginContainer3/ConfirmPasswordInput")
	error_label = get_node("/root/Control/VBoxContainer/MarginContainer4/ErrorLabel")

func cancel():
	get_tree().change_scene_to_file("res://scenes/login_menu.tscn")
	
func on_input_submit(text):
	if not text:
		return
		
	register()

func _on_request_completed(result, response_code, headers, body):
	var response = body.get_string_from_utf8().strip_edges(true, true)
	request_completed.disconnect(_on_request_completed)
	print(response)
	
	if response == "0":
		error_label.text = "[center]User with that name already exists"
	elif response == "1":
		get_tree().change_scene_to_file("res://scenes/login_menu.tscn")

func register():
	if not username_input.text:
		error_label.text = "[center]Please enter a username"
		return
	elif not password_input.text:
		error_label.text = "[center]Please enter a password"
		return
	elif not password_confirm_input.text:
		error_label.text = "[center]Please confirm your password"
		return
	elif not password_confirm_input.text == password_input.text:
		error_label.text = "[center]Passwords don't match"
		return
	
	request_completed.connect(_on_request_completed)
	request("http://127.0.0.1:6969/pongservice/register?user=" + username_input.text + "&password=" + password_input.text)
