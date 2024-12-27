if (!dead) {
	sprite_index = FiwDead;
	audio_play_sound(EnemyDefeat, 10, 0);
	dead = true;
	time_source_start(death_timer);
}