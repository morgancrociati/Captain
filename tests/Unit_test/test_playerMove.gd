extends "res://addons/gut/test.gd"

var playerMove = preload("res://game/script/playerMove.gd")

func test_add_movement():
	var playerM = playerMove.new()
	playerM.init_movement()
	assert_true(playerM.add_movement(Globals.NORTH))
	assert_true(playerM.add_movement(Globals.EAST))
	assert_true(playerM.add_movement(Globals.SOUTH))
	assert_false(playerM.add_movement(Globals.WEST))




