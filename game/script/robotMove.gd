extends Object

class_name RobotMove

# store the cumulative movement
var movement :  Array
var starting_pt : Vector2
var map :Map

var rng = RandomNumberGenerator.new()

func _init(m : Map):
	movement = [Vector2(0,0)]
	map = m
	starting_pt = init_starting_point()
	
func init_starting_point() -> Vector2:
	var starting_pt : Vector2
	var x = rng.randi_range(0, map.length-1)
	var y = rng.randi_range(0, map.width-1)
	while(map.map[x][y] == Globals.LAND):
		x = rng.randi_range(0, map.length-1)
		y = rng.randi_range(0, map.width-1)
	starting_pt.x = x
	starting_pt.y = y
	return starting_pt
	
func can_go_north() -> bool:
	var nextPos = starting_pt + movement.back() + Globals.NORTH 
	if nextPos.x <0 or nextPos.x >= map.length or nextPos.y < 0 or nextPos.y >= map.width or map.map[nextPos.x][nextPos.y] == Globals.LAND:
		return false
	else:
		return true
		
func can_go_south() -> bool:
	var nextPos = starting_pt + movement.back() + Globals.SOUTH 
	if nextPos.x <0 or nextPos.x >= map.length or nextPos.y < 0 or nextPos.y >= map.width or map.map[nextPos.x][nextPos.y] == Globals.LAND:
		return false
	else:
		return true
		
func can_go_east() -> bool:
	var nextPos = starting_pt + movement.back() + Globals.EAST 
	if nextPos.x <0 or nextPos.x >= map.length or nextPos.y < 0 or nextPos.y >= map.width or map.map[nextPos.x][nextPos.y] == Globals.LAND:
		return false
	else:
		return true
		
func can_go_west() -> bool:
	var nextPos = starting_pt + movement.back() + Globals.WEST 
	if nextPos.x <0 or nextPos.x >= map.length or nextPos.y < 0 or nextPos.y >= map.width or map.map[nextPos.x][nextPos.y] == Globals.LAND:
		return false
	else:
		return true

func add_movement(d : Vector2):
	if d != Globals.NORTH and d != Globals.EAST and d != Globals.SOUTH and d != Globals.WEST :
		return false
	#add the new direction to the last position
	var lastPos = movement[movement.size()-1] + d
	for m in movement:
		#if the new position has already been visisted
		if m == lastPos:
			#the direction is not valid
			return false
	#the valid position is add to movement
	movement.append(lastPos)
	return true


