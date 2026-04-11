Boolean_Variable_That_Keeps_Track_Of_Whether_The_Platform_Is_Triggered_To_Fall_Or_Not = false;

Variable_That_Keeps_Track_Of_Time = 0;

xoriginal = x;
yoriginal = y;

find_speed = function(_axis) {
	
	if (_axis == "x") {
		return dx;
	}
	
	return dy;
}

dx = 0;
dy = 0;