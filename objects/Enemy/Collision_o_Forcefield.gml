if (!dead and killable) {
	sprite_index = spr_dead;
	audio_play_sound(sfx_dead, 10, 0);
	dead = true;
	time_source_start(death_timer);
}