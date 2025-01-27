
if (!dead and !_player.invincible) {
		audio_play_sound(Damage, 10, 0);
		_player.change_life(-1);
	}