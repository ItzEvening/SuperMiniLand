var _player = instance_place(x, y, Player);

if (_player != noone and !current) {
	
    update_checkpoints();
	
	audio_play_sound(sfx_Checkpoint, 10, false);
	
	_player.original_x = x;
	_player.original_y = y;
	_player.original_g = grv;
	
	current = true;
	
	if (_player.hp < _player.hp_default){
		audio_play_sound(Recovery, 10, false);
		//_player.hp ++;
		_player.change_life(1);
	}
}
