extends Object

class_name MapCreation

var sizeX: int = -1
var sizeY: int = -1
var zoneSizeX: int = -1
var zoneSizeY: int = -1
var map: Array = []

func init_map(_sizeX: int, _sizeY: int, _zoneSizeX: int = 5, _zoneSizeY: int = 5) -> bool:
	#Making sure the size of the map is at least 2 and the size of the zone at least 1
	if _sizeX <= 1 or _sizeY <= 1 or _zoneSizeX <= 0 or _zoneSizeY <= 0:
		return false
	#Making sure the zone fit the map size
	if _sizeX % _zoneSizeX != 0:
		return false
	if _sizeY % _zoneSizeY != 0:
		return false
	sizeX = _sizeX
	sizeY = _sizeY
	zoneSizeX = _zoneSizeX
	zoneSizeY = _zoneSizeY
	for x in int(sizeX):
		map.append([])
		for y in int(sizeY):
			map[x].append(Globals.WATER)
	return true

func update_map(x:int, y:int, terrainType: int) -> bool:
	if x < 0 or x >= sizeX:
		return false
	if y < 0 or y >= sizeY:
		return false
	map[x][y] = terrainType
	return true

func save_map(mapName: String) -> bool:
	var file = File.new()
	file.open("user://" + mapName + ".map", File.WRITE)
	var infoString := String(sizeX) + " " + String(sizeY) + "\n" + String(zoneSizeX) + " " + String(zoneSizeY) + "\n"
	file.store_string(infoString)
	var mapString := ""
	for line in map:
		for square in line:
			mapString += String(square) + " "
		mapString += "\n"
	file.store_string(mapString)
	return true
