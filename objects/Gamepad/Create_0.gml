gamepads = [];
horizontal_prev = 0;
vertical_prev = 0;

active_gamepad = function() {
	return array_length(gamepads) > 0;
}

get_joystick_horizontal = function() {
	if (!active_gamepad()) {
		horizontal_prev = 0;
		return 0;
	}
	
	horizontal_prev = gamepad_axis_value(gamepads[0], gp_axislh);
	return horizontal_prev;
}

get_joystick_vertical = function() {
	if (!active_gamepad()) {
		vertical_prev = 0;
		return 0;
	}
	
	vertical_prev = gamepad_axis_value(gamepads[0], gp_axislv);
	return vertical_prev;
}

get_jump = function() {
	if (!active_gamepad()) {
		return false;
	}
	
	return gamepad_button_check_pressed(gamepads[0], gp_face2);
}

get_jump_hold = function() {
	if (!active_gamepad()) {
		return false;
	}
	
	return gamepad_button_check(gamepads[0], gp_face2);
}

get_jump_released = function() {
	if (!active_gamepad()) {
		return false;
	}	
	
	return gamepad_button_check_released(gamepads[0], gp_face2);
}

get_joystick_release = function() {
	if (!active_gamepad()) {
		return false;
	}		
	
	var _h_prev = horizontal_prev;
	var _v_prev = vertical_prev;
	return get_joystick_horizontal() == 0 && _h_prev != 0 &&
		   get_joystick_vertical() == 0 && _v_prev != 0;
}