move_with_grounded_solid();

if (meeting_solid(x, y)) {
	unsquish();
	
	if (meeting_solid(x, y)) {
		audio_play_sound(Damage, 10, 0);
		handle_death();
	}
}
