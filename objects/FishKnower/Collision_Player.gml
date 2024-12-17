var _player = instance_place(x, y, Player);

if (_player != noone) {
	
	if (!dead and !_player.invincible) {
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

