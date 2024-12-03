var _player = instance_place(x, y, Player);

if (_player != noone) {
	

	
	 if (!_player.invincible) {
		audio_play_sound(Damage, 10, 0);
	
		
			_player.handle_death();
		
	}
	
}

