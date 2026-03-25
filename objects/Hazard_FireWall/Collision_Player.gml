var _player = instance_place(x, y, Player);

if (_player != noone) {
	
	 if (!_player.invincible and !consumed) {
		audio_play_sound(Damage, 10, 0);
		
		if (global.difficulty == 0) {
			_player.handle_death();
		}
		else {
			_player.game_over();
			consumed = true;
			MusicPlayer.stop_music();
		}
	}
}

