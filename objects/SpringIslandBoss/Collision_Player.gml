var _player = instance_place(x, y, Player);

if (_player != noone and !invincible) {
	
	// hit
	if (_player.y < y and _player.vsp > -3 and !dead) {
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
	
	else if (!_player.invincible) {
		audio_play_sound(Damage, 10, 0);
	
		if (_player.hp == 0) 
		{
			_player.handle_death();
		}
		else {
			//_player.hp--;
			_player.change_life(-1);
			_player.reset_iframe();
		}
	}
	
}

