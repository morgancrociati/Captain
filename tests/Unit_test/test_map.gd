extends "res://addons/gut/test.gd"

var map = preload("res://game/script/map.gd")
var mapCreation = preload("res://editor/script/map_creation.gd")
var playerMove = preload("res://game/script/playerMove.gd")

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

func test_init_possibilities():
	var mC = mapCreation.new()
	var m = map.new()
	mC.init_map(3, 3, 1, 1)
	mC.update_map(1, 1, Globals.LAND)
	mC.update_map(1, 2, Globals.LAND)
	mC.save_map("test_map")
	m.load_map("test_map")
	var possibilities = m.init_possibilities()
	assert_eq(possibilities,[Vector2(0,0), Vector2(0,1), Vector2(0,2), Vector2(1,0), Vector2(2,0), Vector2(2,1), Vector2(2,2)])

func test_get_possibilities():
	var mC = mapCreation.new()
	var m = map.new()
	mC.init_map(3, 3, 1, 1)
	mC.update_map(1, 1, Globals.LAND)
	mC.update_map(1, 2, Globals.LAND)
	mC.save_map("test_map")
	m.load_map("test_map")
	var pM = playerMove.new(m)
	assert_eq(pM.possibilities,[Vector2(0,0), Vector2(0,1), Vector2(0,2), Vector2(1,0), Vector2(2,0), Vector2(2,1), Vector2(2,2)])
	pM.add_movement(Globals.EAST)
	pM.possibilities = m.get_possibilities(pM.movement, pM.possibilities)
	assert_eq(pM.possibilities,[Vector2(0,0), Vector2(1,0)])
	pM.add_movement(Globals.EAST)
	pM.possibilities = m.get_possibilities(pM.movement, pM.possibilities)
	assert_eq(pM.possibilities,[Vector2(0,0)])

