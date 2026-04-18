moving = false;
Variable_That_Keeps_Track_Of_Time = 0;

xoriginal = x;
yoriginal = y;
ydir = 1;
foreground_tiles = layer_get_id("Foreground_Tiles");

find_speed = function(_axis) {
	
	if (_axis == "x") {
		return dx;
	}
	
	return dy;
}

dx = 0;
dy = 0;