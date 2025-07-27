event_inherited();
if (path_index == -1 and !dead) {
	
	if (current_state == boss_states.move) {
		frame = BOSS_IDLE;
		current_state = boss_states.fade_out;
	}
	
	squish();
}

if (dead and !obey_gravity) {
	obey_gravity = true;
	path_end();
}