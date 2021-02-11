extends "res://addons/gut/test.gd"

var mapCreation = preload("res://editor/script/map_creation.gd")

func test_init_map():
	var mapC = mapCreation.new()
	assert_false(mapC.init_map(-1, -2))
	assert_false(mapC.init_map(8, 8))
	assert_false(mapC.init_map(15, 15, 0, 0))
	assert_false(mapC.init_map(20, 20, -1, -1))
	assert_true(mapC.init_map(10, 10))
	assert_true(mapC.init_map(12, 12, 4, 4))

func test_map_update():
	var mapC = mapCreation.new()
	var length := 10
	var width := 10
	assert_true(mapC.init_map(length, width))
	for i in range(-1, length + 1):
		for j in range(-1, width + 1):
			if(i < 0 or i >= length or j < 0 or j >= width):
				assert_false(mapC.update_map(i, j, Globals.WATER))
			else:
				assert_true(mapC.update_map(i, j, Globals.WATER))
	

func test_map_save():
	var mapC = mapCreation.new()
	var length := 10
	var width := 10
	assert_true(mapC.init_map(length, width))
	assert_true(mapC.update_map(2, 2, Globals.LAND))
	assert_true(mapC.save_map("test_map"))
	assert_file_exists(mapC.prefixe + "test_map" + mapC.suffixe)
	gut.file_delete(mapC.prefixe + "test_map" + mapC.suffixe)
