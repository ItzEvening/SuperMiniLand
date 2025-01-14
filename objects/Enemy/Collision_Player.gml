var _player = instance_place(x, y, Player);

if (_player != noone) {
	
	// kill 
	if (_player.y < bbox_top and !dead and _player.vsp > -3 and killable) {
		sprite_index = spr_dead;
		audio_play_sound(sfx_dead, 10, 0);
		dead = true;
		time_source_start(death_timer);
		_player.vsp = -5;
	}
	
	else if (!dead and !_player.invincible) {
		audio_play_sound(Damage, 10, 0);
		_player.change_life(-1);
		
		
		//if (_player.hp == 0) 
		//{
		//	_player.handle_death();
		//}
		//else {
		//	_player.change_life(-1);
		//	_player.reset_iframe();
		//}
	}
	
}