var _player = instance_place(x, y, Player);

if (_player != noone and !_player.invincible) {
	
	// kill barry
	if (_player.y < y and _player.vsp > 0) {
		sprite_index = BarDead;
		dead = true;
		time_source_start(death_timer);
	}
	
	else if (!dead) {
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

