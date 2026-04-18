enum LIFTSTATE {
	READY,
	IDLE,
	ASCENDING,
	DESCENDING
}

current_state = LIFTSTATE.READY;
come_back = false;

tiktok = undefined;

// deciding next direction
next_direction = LIFTSTATE.DESCENDING;
if (init_direction == "UP") {
	next_direction = LIFTSTATE.ASCENDING;
}

// deciding y bound
if (next_direction == LIFTSTATE.DESCENDING) {
	y_min = y;
}
else if (next_direction == LIFTSTATE.ASCENDING) {
	y_max = y;
}

xoriginal = x;
yoriginal = y;

find_speed = function(_axis) {
	
	if (_axis == "x") {
		return dx;
	}
	
	return dy;
}

stop_lift = function() {
	current_state = LIFTSTATE.IDLE;
	
	if (tiktok != undefined and audio_is_playing(tiktok)) {
		audio_stop_sound(tiktok);
	}
}

should_return = function(_id) {
	if (_id == platform_id and current_state == LIFTSTATE.READY and next_direction == LIFTSTATE.DESCENDING) {
		come_back = true;
	}
}

dy = 0;
global.lo.add(self, LIFT_RETURN, should_return);