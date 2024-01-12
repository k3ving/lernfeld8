extends HTTPRequest

var username_input
var password_input
var error_label

func _ready():
	username_input = get_node("/root/Control/VBoxContainer/MarginContainer/UsernameInput")
	password_input = get_node("/root/Control/VBoxContainer/MarginContainer2/PasswordInput")
	error_label = get_node("/root/Control/VBoxContainer/MarginContainer3/ErrorLabel")
	
func register():
	get_tree().change_scene_to_file("res://scenes/registration_menu.tscn")

func _on_request_completed(result, response_code, headers, body):
	var response = body.get_string_from_utf8().strip_edges(true, true)
	request_completed.disconnect(_on_request_completed)
	
	if response == "0":
		error_label.text = "[center]Wrong credentials"
	elif response == "1":
		PlayerVariables.player_name = username_input.text
		get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

func on_input_submit(text):
	login()

func login():
	if not username_input.text or not password_input.text:
		return
	
	request_completed.connect(_on_request_completed)
	request("http://127.0.0.1:6969/pongservice/login?user=" + username_input.text + "&password=" + password_input.text)
