extends "res://addons/gut/test.gd"

var map = preload("res://game/script/map.gd")
var mapCreation = preload("res://editor/script/map_creation.gd")

func test_load_map():
	var mC = mapCreation.new()
	assert_true(mC.init_map(10, 10))
	assert_true(mC.update_map(2, 2, Globals.LAND))
	assert_true(mC.save_map("test_map"))
	assert_file_exists(mC.prefixe + "test_map" + mC.suffixe)
	var m = map.new()
	assert_true(m.load_map("test_map"))
	assert_true(m.map[2][2] == Globals.LAND)
	gut.file_delete(mC.prefixe + "test_map" + mC.suffixe)
