event_inherited();

obey_gravity = false;

hp = 14;

path_direction = 1;

squish_factor = 1;

current_state = boss_states.move;

chosen_path = path_duplicate(path_CK);

pth_speed = 2;

frame = BOSS_RIGHT;


enum boss_states {
	move,
	fade_in,
	fade_out
}

get_frame_index = function(_status) {
	switch(frame) {
		case BOSS_IDLE:
			return 0;
		case BOSS_RIGHT:
			return 1;
		case BOSS_LEFT:
			return 2;
		case BOSS_HURT:
			return 3;
		case BOSS_DEAD:
			return 4;
	}
}


follow_path = function() {
	path_start(chosen_path, pth_speed * path_direction, path_action_stop, true);
}

change_path = function() {
	path_delete(chosen_path);
	
	var _path_list = [path_CK];
	
	if (phase > 0) {
		array_push(_path_list, path_CK_divot_down, path_CK_divot_up, 
			path_CK_logistic_up, path_CK_logistic_down, path_CK_sine_up, path_CK_sine_down);
	}
	if (phase > 1) {
		
		array_push(_path_list, path_CK_Z_up, path_CK_Z_down, path_CK_megasine_down, path_CK_megasine_up);
		
		if (path_direction == 1) {
			array_push(_path_list, path_CK_accelerate_left);
		}
		else {
			array_push(_path_list, path_CK_accelerate_right);
		}
	}
	
	var _chosen_index = irandom(array_length(_path_list) - 1);
	
	chosen_path = path_duplicate(_path_list[_chosen_index]);
	
	var _path_offset_x = random(200) - 100;
	var _path_offset_y = random(200) - 100;
	
	path_shift(chosen_path, _path_offset_x, _path_offset_y);
}

squish = function() {
	if (current_state == boss_states.fade_out) {
		if (squish_factor > 0) {
			squish_factor -= 0.05;
		}
		else {
			current_state = boss_states.fade_in;
			
			// write change pos here
			teleport();
		}
	}
	
	else if (current_state == boss_states.fade_in) {
		if (squish_factor < 1) {
			squish_factor += 0.05;
		}
		else {
			current_state = boss_states.move;
			path_direction *= -1;
			follow_path();
		}
	}
}

teleport = function() {
	// REMINDER: although chosen path has changed to the new path to follow,
	// the path direction is still the previous one
	
	change_path();
	var _p_index = 0;
	
	if (path_direction == 1) {
		_p_index = path_get_number(chosen_path) - 1;
	}
	
	var _x = path_get_x(chosen_path, _p_index);
	var _y = path_get_y(chosen_path, _p_index);
	
	x = _x;
	y = _y
	
	// change direction to face
	if (path_direction == 1) {
		frame = BOSS_LEFT;
	}
	else if (path_direction == -1) {
		frame = BOSS_RIGHT;
	}
}

// so goddamn special you need your own overwritten recover function, eh?
recover = function() {
	invincible = false;
	hurt = false;
	
	if (path_index == -1 && current_state != boss_states.move) {
		frame = BOSS_IDLE;
	}
	else if (path_direction == 1) {
		frame = BOSS_RIGHT;
	}
	else if (path_direction == -1) {
		frame = BOSS_LEFT;
	}
}

// circle king phasessss
change_phase = function() {
	if (hp == 9) {
		phase = 1;
		pth_speed = 2.5;
	}
	else if (hp == 4) {
		phase = 2;
		pth_speed = 3;
	}
}

follow_path();