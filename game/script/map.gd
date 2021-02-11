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

