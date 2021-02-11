extends "res://addons/gut/test.gd"

var mapCreation = preload("res://editor/script/map_creation.gd")

func test_init_map():
	var map = mapCreation.new()
	assert_true(map.init_map(10, 10))

