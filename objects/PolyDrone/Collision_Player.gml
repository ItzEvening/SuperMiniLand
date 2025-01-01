var _player = instance_place(x, y, Player);

if (_player != noone) {
	
	if (_player.y < y - 10 and !dead and _player.vsp > -3) {
		sprite_index = DroneDead;
		audio_play_sound(sfx_Drone_Defeat, 10, 0);
		dead = true;
		time_source_start(death_timer);
		_player.vsp = -5;
	}
	
	else if (!dead and !_player.invincible) {
		audio_play_sound(Damage, 10, 0);
	
		if (_player.hp == 0) 
		{
			_player.handle_death();
		}
		else {
			_player.change_life(-1);
			_player.reset_iframe();
		}
	}
	
}

