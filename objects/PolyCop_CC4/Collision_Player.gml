var _player = instance_place(x, y, Player);

if (_player != noone) {
	
	 if (!_player.invincible) {
		audio_play_sound(Damage, 10, 0);
	    Player.x = Player.original_x;
		Player.y = Player.original_y;
		Player.hascontrol = true;
	}
}