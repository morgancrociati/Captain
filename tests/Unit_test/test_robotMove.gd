extends "res://addons/gut/test.gd"

var map = preload("res://game/script/map.gd")
var mapCreation = preload("res://editor/script/map_creation.gd")
var robotMove = preload("res://game/script/robotMove.gd")

func test_init_starting_point():
	var mC = mapCreation.new()
	var m = map.new()
	mC.init_map(3, 3, 1, 1)
	mC.update_map(1, 1, Globals.LAND)
	mC.update_map(1, 2, Globals.LAND)
	mC.save_map("test_map")
	m.load_map("test_map")
	var rM = robotMove.new(m)
	var pt 
	for i in range(20):
		pt = rM.init_starting_point()
		print(pt)
		assert_ne(pt,Vector2(1,1))
		assert_ne(pt,Vector2(1,2))
		
func test_can_go_north():
	var mC = mapCreation.new()
	var m = map.new()
	mC.init_map(3, 3, 1, 1)
	mC.update_map(1, 1, Globals.LAND)
	mC.update_map(1, 2, Globals.LAND)
	mC.save_map("test_map")
	m.load_map("test_map")
	var rM = robotMove.new(m)
	rM.starting_pt = Vector2(0,1)
	assert_true(rM.can_go_north())
	rM.starting_pt = Vector2(0,0)
	assert_false(rM.can_go_north())
	rM.starting_pt = Vector2(2,2)
	assert_true(rM.can_go_north())
	rM.starting_pt = Vector2(2,0)
	assert_false(rM.can_go_north())
	
func test_can_go_south():
	var mC = mapCreation.new()
	var m = map.new()
	mC.init_map(3, 3, 1, 1)
	mC.update_map(1, 1, Globals.LAND)
	mC.update_map(1, 2, Globals.LAND)
	mC.save_map("test_map")
	m.load_map("test_map")
	var rM = robotMove.new(m)
	rM.starting_pt = Vector2(0,0)
	assert_true(rM.can_go_south())
	rM.starting_pt = Vector2(0,2)
	assert_false(rM.can_go_south())
	rM.starting_pt = Vector2(2,0)
	assert_true(rM.can_go_south())
	rM.starting_pt = Vector2(2,2)
	assert_false(rM.can_go_south())
	
func test_can_go_east():
	var mC = mapCreation.new()
	var m = map.new()
	mC.init_map(3, 3, 1, 1)
	mC.update_map(1, 1, Globals.LAND)
	mC.update_map(1, 2, Globals.LAND)
	mC.save_map("test_map")
	m.load_map("test_map")
	var rM = robotMove.new(m)
	rM.starting_pt = Vector2(1,0)
	assert_true(rM.can_go_east())
	rM.starting_pt = Vector2(2,0)
	assert_false(rM.can_go_east())
	rM.starting_pt = Vector2(0,0)
	assert_true(rM.can_go_east())
	rM.starting_pt = Vector2(2,2)
	assert_false(rM.can_go_east())

func test_can_go_west():
	var mC = mapCreation.new()
	var m = map.new()
	mC.init_map(3, 3, 1, 1)
	mC.update_map(1, 1, Globals.LAND)
	mC.update_map(1, 2, Globals.LAND)
	mC.save_map("test_map")
	m.load_map("test_map")
	var rM = robotMove.new(m)
	rM.starting_pt = Vector2(1,0)
	assert_true(rM.can_go_west())
	rM.starting_pt = Vector2(0,0)
	assert_false(rM.can_go_west())
	rM.starting_pt = Vector2(2,0)
	assert_true(rM.can_go_west())
	rM.starting_pt = Vector2(0,2)
	assert_false(rM.can_go_west())
