extends Object

class_name MapCreation

var size: Vector2 = Vector2(-1, -1)
var zoneSize: Vector2 = Vector2(-1, -1)
var map: Array = []

func _ready():
	pass

func init_map(_size: Vector2, _zoneSize := Vector2(5, 5)) -> bool:
	#Making sure the size of the map is at least 2 and the size of the zone at least 1
	if _size.x <= 1 or _size.y <= 1 or _zoneSize.x <= 0 or _zoneSize.y <= 0:
		return false
	#Making sure the size given is an integer
	if int(_size.x) != _size.x or int(_size.y) != _size.y:
		return false
	#Making sure the zoneSize given is an integer
	if int(_size.x) != _size.x or int(_size.y) != _size.y:
		return false
	#Making sure the zone fit the map size
	if int(_size.x) % int(_zoneSize.x) != 0:
		return false
	if int(_size.y) % int(_zoneSize.y) != 0:
		return false
	size = _size
	zoneSize = _zoneSize
	for x in int(size.x):
		map[x] = []
		for y in int(size.y):
			map[x][y] = 0
	return true

func update_map(pos: Vector2):
	pass
