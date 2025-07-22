event_inherited();
if (path_index == -1) {
	
	if (current_state == boss_states.move) {
		image_index = boss_sprites.idle;
		current_state = boss_states.fade_out;
	}
	
	squish();
}