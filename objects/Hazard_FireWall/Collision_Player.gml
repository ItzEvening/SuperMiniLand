var _player = instance_place(x, y, Player);

if (_player != noone) {
	
	 if (!_player.invincible and !consumed) {
		audio_play_sound(Damage, 10, 0);
		audio_stop_all();
		room_goto(ChallengeFailed_Room);
	}
	
	consumed = true;
}

