extends Object

class_name Map

var length: int = -1
var width: int = -1
var zoneLength: int = -1
var zoneWidth: int = -1
var map: Array

func load_map(mapName: String) -> bool:
	var file = File.new()
	file.open("user://" + mapName + ".map", File.READ)
	var size = file.get_line().split(" ")
	length = int(size[0])
	width = int(size[1])
	var sizeZone = file.get_line().split(" ")
	zoneLength = int(sizeZone[0])
	zoneWidth = int(sizeZone[1])
	var line
	for x in length:
		map.append([])
		line = file.get_line().split(" ")
		for y in width:
			map[x].append(int(line[y]))
	file.close()
	return true

#init the array possibilities with all the possible starting point of the players
#which mean all points expect the lands points
func init_possibilities() -> Array:
	var possibilities : Array = []
	for x in length:
		for y in width:
			if map[x][y] != Globals.LAND:
				possibilities.append(Vector2(x,y))
	return possibilities

#update all the possible starting point
func get_possibilities(movement : Array, possibilities : Array) -> Array:
	var newPoss : Array = []
	var testPoss : Vector2
	for p in possibilities:
		testPoss = p + movement.back()
		if testPoss.x <0 or testPoss.x >= length or testPoss.y < 0 or testPoss.y >= width or map[testPoss.x][testPoss.y] == Globals.LAND:
			pass
		else:
			newPoss.append(p)
	return newPoss
