var _player = instance_place(x, y, Player);

if (_player != noone) {
	
	// kill larry
	if (_player.y < y - 10 and !dead and _player.vsp > -3) {
		sprite_index = GarDead;
		audio_play_sound(EnemyDefeat, 10, 0);
		dead = true;
		time_source_start(death_timer);
		_player.vsp = -5;
	}
	
	else if (!dead and !_player.invincible) {
		audio_play_sound(Damage, 10, 0);
	
		// PUT THIS BACK FOR FULL GAME
		//if (_player.hp == 0) 
		//{
		//	_player.handle_death();
		//}
		//else {
		//	//_player.hp--;
		//	_player.change_life(-1);
		//	_player.reset_iframe();
		//}
		
		_player.x = _player.original_x;
		_player.y = _player.original_y;
	}
	
}

