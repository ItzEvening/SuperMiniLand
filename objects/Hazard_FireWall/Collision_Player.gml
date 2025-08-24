var _player = instance_place(x, y, Player);

if (_player != noone) {
	
	 if (!_player.invincible and !consumed) {
		audio_play_sound(Damage, 10, 0);
		_player.game_over();
	}
	
	consumed = true;
}

