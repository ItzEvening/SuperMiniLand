var _thing = instance_place(x, y - 1, Player);
dy = 0;

// player left lift, make it triggerable
if (_thing == noone and current_state == LIFTSTATE.IDLE) {
	current_state = LIFTSTATE.READY;
}

// player entered lift while triggerable
else if ((_thing != noone or come_back) and current_state == LIFTSTATE.READY) {
	current_state = next_direction;
	come_back = false;
	tiktok = audio_play_sound(sfx_SalmonLift,10,1);
	
	if (current_state == LIFTSTATE.ASCENDING) {
		next_direction = LIFTSTATE.DESCENDING;
	}
	else if (current_state == LIFTSTATE.DESCENDING) {
		next_direction = LIFTSTATE.ASCENDING;
	}
}

// lift is ascending
else if (current_state == LIFTSTATE.ASCENDING) {
	var next_y = max(y - 2, y_min);
	dy = next_y - y;
	
	if (next_y == y_min) {
		stop_lift();
	}
}

// lift is descending
else if (current_state == LIFTSTATE.DESCENDING) {
	var next_y = min(y + 2, y_max);
	dy = next_y - y;
	
	if (next_y == y_max) {
		stop_lift();
	}
}

// make elevator come back in future if player left 
//if (current_state == LIFTSTATE.ASCENDING and Player.y > y + 64) {
//	come_back = true;
//}

y += dy;

// moving platform code
if (_thing != noone && !_thing.nudged  && _thing.obey_collisions) {
	_thing.nudge(0, dy);
	_thing.nudged = true;
}

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