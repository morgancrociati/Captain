extends "res://addons/gut/test.gd"

var playerMove = preload("res://game/script/playerMove.gd")
var map = preload("res://game/script/map.gd")

func test_add_movement():
	var m = map.new()
	var playerM = playerMove.new(m)
	assert_true(playerM.add_movement(Globals.NORTH))
	assert_true(playerM.add_movement(Globals.EAST))
	assert_true(playerM.add_movement(Globals.SOUTH))
	assert_false(playerM.add_movement(Globals.WEST))




