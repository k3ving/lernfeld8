extends GutTest

var BallStart = load('res://scripts/ball_start.gd')
var BallMove = load('res://scripts/ball_move.gd')
var Player = load('res://scripts/player_move.gd')

func test_ball_exist():
	var _ball = BallStart.new()
	assert_null(_ball)
	
func test_player_exist():
	var _player = Player.new()
	assert_not_null(_player)
	
func test_ball_speed():
	var _ball = BallMove.new()
	assert_accessors(_ball, 'speed', -200, 0)
	
func test_player_speed():
	var _player = Player.new()
	assert_accessors(_player, 'speed', 0, 200)
	
func test_ball_direction():
	var _ball = BallMove.new();
	assert_accessors(_ball,'velocity', Vector2(0, 0), Vector2(1, 1))
	
#func test_ball_moves_process_horizontally():
#	var _ball = BallMove.new()
#	_ball.set_speed(10)
#	_ball.set_velocity(Vector2(1, 0))
#	simulate(_ball, 1, 1)
#	assert_eq(_ball.get_position(), Vector2(10, 0))
	
#func test_ball_moves_process_vertical():
#	var _ball = BallMove.new()
#	_ball.set_speed(10)
#	_ball.set_velocity(Vector2(0, 1))
#	simulate(_ball, 1, 1)
#	assert_eq(_ball.get_position(), Vector2(0, 10))
	
