extends Object

class_name MapCreation

var length: int = -1
var width: int = -1
var zoneLength: int = -1
var zoneWidth: int = -1
var map: Array

const prefixe := "user://"
const suffixe := ".map"

func init_map(_length: int, _width: int, _zoneLength := 5, _zoneWidth := 5) -> bool:
	#Making sure the size of the map is at least 2 and the size of the zone at least 1
	if _length <= 1 or _width <= 1 or _zoneLength <= 0 or _zoneWidth <= 0:
		return false
	#Making sure the zone fit the map size
	if _length % _zoneLength != 0:
		return false
	if _width % _zoneWidth != 0:
		return false
	length = _length
	width = _width
	zoneLength = _zoneLength
	zoneWidth = _zoneWidth
	for x in length:
		map.append([])
		for y in width:
			map[x].append(Globals.WATER)
	return true

func update_map(x:int, y:int, terrainType: int) -> bool:
	if x < 0 or x >= length:
		return false
	if y < 0 or y >= width:
		return false
	map[x][y] = terrainType
	return true

func save_map(mapName: String) -> bool:
	var file = File.new()
	file.open(prefixe + mapName + suffixe, File.WRITE)
	var infoString := String(length) + " " + String(width) + "\n" + String(zoneLength) + " " + String(zoneWidth) + "\n"
	file.store_string(infoString)
	var mapString := ""
	for line in map:
		for square in line:
			mapString += String(square) + " "
		mapString += "\n"
	file.store_string(mapString)
	file.close()
	return true
