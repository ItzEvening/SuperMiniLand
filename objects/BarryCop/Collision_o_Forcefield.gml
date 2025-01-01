if (!dead) {
	sprite_index = CBarDead;
	audio_play_sound(EnemyDefeat2, 10, 0);
	dead = true;
	time_source_start(death_timer);
}