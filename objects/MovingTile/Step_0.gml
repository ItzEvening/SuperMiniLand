var _thing = instance_place(x, y - 1, PhysicsBody);

x = round(guide.x);
y = round(guide.y);

var _dx = x - xprevious;
var _dy = y - yprevious;

if (_thing != noone) {
	_thing.nudge(_dx, _dy);
}


// 

var _thing2 = instance_place(x, y, PhysicsBody);

if (_thing2 != noone) {
	
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