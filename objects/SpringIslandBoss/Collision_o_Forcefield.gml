if (!dead and !invincible) {
	audio_play_sound(EnemyDefeat, 10, 0);
	_player.vsp = -5;
		
	invincible = true;
		 
	if (hp > 0) {
		time_source_start(invincible_timer);
		state = 2;
		hp--;
			
		change_phase();
	}
	else {
		time_source_start(end_timer);
		dead = true;
		MusicPlayer.stop_music();
		state = 3;
	}
}