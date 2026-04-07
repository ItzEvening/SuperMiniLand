event_inherited();

// increment jump commit timer
if (current_state == QARSTATE.JUMPING) {
	jump_commit_t += delta_time / 1000000;
}


if (!dead and current_state == QARSTATE.STILL) {
	x = x_center + random_range(-1 * x_rad, x_rad);
	
	if (x_rad < x_rad_max) {
		x_rad += x_rad_growth;
	}
	
	var ygood = abs(Player.y - y) < 32 * 6;
	var inrange = distance_to_object(Player) < detect_distance;
	var jump_timer_running = time_source_get_state(jump_timer) == time_source_state_active;
	
	if (ygood and inrange and !jump_timer_running) {
		time_source_start(jump_timer);
	}
	
	// Player has entered superposition cloud
	else if (abs(Player.y - y < 16) and abs(Player.x - x) < x_rad) {
		
		if (jump_timer_running) {
			time_source_stop(jump_timer);
		}
		
		jump();
	}
}

if (meeting_solid(x, y + sign(grv)) and current_state == QARSTATE.JUMPING and !just_jumped) {
	jump_finish();
}

// trigger jump commit
if (jump_commit_t >= jump_commit_t_max) {
	jump_commit_t = 0;
	jump_commit();
}

if (dead) {
	obey_gravity = true;
	inertial = true;
}