var _player = instance_place(x, y, Player);

if (_player != noone) {
	
	// kill 
	if (good_to_kill(_player)) {
		hurt();

		_player.vsp = -5;
	}
	
	else if (!dead and hostile and !_player.invincible and !place_meeting(x, y, o_Forcefield)) {
		audio_play_sound(Damage, 10, 0);
		_player.change_life(-1 * offense);
	}
	
}