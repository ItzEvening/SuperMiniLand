var _player = instance_place(x, y, Player);

if (_player != noone) {
	
	// kill barry
	if (_player.y < y - 10 and !dead and _player.vsp > -3) {
		sprite_index = BarDead;
		audio_play_sound(EnemyDefeat2, 10, 0);
		dead = true;
		time_source_start(death_timer);
	}
	
	else if (!dead and !_player.invincible) {
		audio_play_sound(Damage, 10, 0);
	
		if (_player.hp == 0) 
		{
			_player.handle_death();
		}
		else {
			_player.hp--;
			_player.reset_iframe();
		}
	}
	
}

