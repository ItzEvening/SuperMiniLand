event_inherited();

obey_gravity = false;

full_scale = 0.08;

hp = 8;

path_direction = 1;

squish_factor = 1;

current_state = boss_states.move;

chosen_path = path_duplicate(CircleKingPath1);


// for sprites
enum boss_sprites {
	idle,
	right,
	left,
	hurt
}

enum boss_states {
	move,
	fade_in,
	fade_out
}
image_index = boss_sprites.right;


follow_path = function() {
	path_start(chosen_path, 2 * path_direction, path_action_stop, true);
}

change_path = function() {
	path_delete(chosen_path);
	
	chosen_path = path_duplicate(CircleKingPath1);
	
	var _path_offset_x = random(200) - 100;
	var _path_offset_y = random(200) - 100;
	
	path_shift(chosen_path, _path_offset_x, _path_offset_y);
}

squish = function() {
	if (current_state == boss_states.fade_out) {
		if (squish_factor > 0) {
			squish_factor -= 0.05;
			update_scale();
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
			update_scale();
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
		image_index = boss_sprites.left;
	}
	else if (path_direction == -1) {
		image_index = boss_sprites.right;
	}
}

update_scale = function() {
	image_xscale = full_scale;
	image_yscale = full_scale * squish_factor;
}

follow_path();
update_scale();