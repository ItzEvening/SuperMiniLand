var _thing = instance_place(x, y - 1, PhysicsBody);
dy = 0;

if (_thing != noone and !moving) {
	moving = true;
	ydir = 1;
}

xprevious = x;
yprevious = y;

if (moving) {
	
	y += ydir;
	dy = ydir;
	
	// tick timer
	if (ydir == 1) {
		Variable_That_Keeps_Track_Of_Time += delta_time / 1000000;
	}
			
	if (y <= yoriginal) {
		y = yoriginal;
		moving = false;
	}
}

if (_thing != noone && !_thing.nudged  && _thing.obey_collisions) {
	_thing.nudge(dx, dy);
	_thing.nudged = true;
}


if (Variable_That_Keeps_Track_Of_Time >= 10 or (max_depth != -1 and y > yoriginal + 32 * max_depth)) {
	ydir = -1;
	Variable_That_Keeps_Track_Of_Time = 0;
}


// moving platform code

var _thing2 = instance_place(x, y, PhysicsBody);

if (_thing2 != noone && _thing2.obey_collisions) {
	
	var _nudge_dx = 0;
	var _nudge_dy = 0;
	var _nudge_lowest = 0;
	
	
	// left
	_nudge_dx = bbox_left - _thing2.bbox_right;
	_nudge_lowest = abs(_nudge_dx);
	
	// up
	if (abs(bbox_top - _thing2.bbox_bottom) < _nudge_lowest) {
		_nudge_dx = 0;
		_nudge_dy = bbox_top - _thing2.bbox_bottom;
		_nudge_lowest = abs(_nudge_dy);
	}
	
	// right
	if (bbox_right - _thing2.bbox_left < _nudge_lowest) {
		_nudge_dx = bbox_right - _thing2.bbox_left;
		_nudge_dy = 0;
		_nudge_lowest = _nudge_dx;
	}
	
	// down
	if (bbox_bottom - _thing2.bbox_top < _nudge_lowest) {
		_nudge_dx = 0;
		_nudge_dy = bbox_bottom - _thing2.bbox_top;
		_nudge_lowest = _nudge_dy;
	}
	
	_thing2.x += _nudge_dx;
	_thing2.y += _nudge_dy;
}