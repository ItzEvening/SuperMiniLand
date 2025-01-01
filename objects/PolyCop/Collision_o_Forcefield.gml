if (!dead) {
	sprite_index = CopCarDead;
	audio_play_sound(sfx_Car_Horn, 10, 0);
	dead = true;
	time_source_start(death_timer);
}