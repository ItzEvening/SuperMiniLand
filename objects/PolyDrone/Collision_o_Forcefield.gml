if (!dead) {
	sprite_index = DroneDead;
	audio_play_sound(sfx_Drone_Defeat, 10, 0);
	dead = true;
	time_source_start(death_timer);
}