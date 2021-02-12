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
		var lastPos = movement.back() + Globals.NORTH
		for m in movement:
		#if the new position has already been visisted
			if m == lastPos:
				#the direction is not valid
				return false
		return true
		
func can_go_south() -> bool:
	var nextPos = starting_pt + movement.back() + Globals.SOUTH 
	if nextPos.x <0 or nextPos.x >= map.length or nextPos.y < 0 or nextPos.y >= map.width or map.map[nextPos.x][nextPos.y] == Globals.LAND:
		return false
	else:
		var lastPos = movement.back() + Globals.SOUTH
		for m in movement:
		#if the new position has already been visisted
			if m == lastPos:
				#the direction is not valid
				return false
		return true
		
func can_go_east() -> bool:
	var nextPos = starting_pt + movement.back() + Globals.EAST 
	if nextPos.x <0 or nextPos.x >= map.length or nextPos.y < 0 or nextPos.y >= map.width or map.map[nextPos.x][nextPos.y] == Globals.LAND:
		return false
	else:
		var lastPos = movement.back() + Globals.EAST
		for m in movement:
		#if the new position has already been visisted
			if m == lastPos:
				#the direction is not valid
				return false
		return true
		
func can_go_west() -> bool:
	var nextPos = starting_pt + movement.back() + Globals.WEST 
	if nextPos.x <0 or nextPos.x >= map.length or nextPos.y < 0 or nextPos.y >= map.width or map.map[nextPos.x][nextPos.y] == Globals.LAND:
		return false
	else:
		var lastPos = movement.back() + Globals.WEST
		for m in movement:
		#if the new position has already been visisted
			if m == lastPos:
				#the direction is not valid
				return false
		return true

func add_movement(d : Vector2):
	if d != Globals.NORTH and d != Globals.EAST and d != Globals.SOUTH and d != Globals.WEST :
		return false
	#add the new direction to the last position
	var lastPos = movement.back() + d
	for m in movement:
		#if the new position has already been visisted
		if m == lastPos:
			#the direction is not valid
			return false
	#the valid position is add to movement
	movement.append(lastPos)
	return true

func move():
	var nextDir 
	var ok = false
	var test : Array = [true,true,true,true]
	var verif : Array = [false,false,false,false]
	rng.randomize()
	while ok == false and test != verif:
		nextDir = rng.randi_range(0, 3)
		match nextDir:
			0:
				print(nextDir)
				if can_go_north() == true:
					ok = true
					add_movement(Globals.NORTH)
				else:
					test[0] = false
			1:
				print(nextDir)
				if can_go_south() == true:
					ok = true
					add_movement(Globals.SOUTH)
				else:
					test[1] = false
			2:
				print(nextDir)
				if can_go_east() == true:
					ok = true
					add_movement(Globals.EAST)
				else:
					test[2] = false
			3:
				print(nextDir)
				if can_go_west() == true:
					ok = true
					add_movement(Globals.WEST)
				else:
					test[3] = false
	if test == verif:
		print("retourn to surface")
		
