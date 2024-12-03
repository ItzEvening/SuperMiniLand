var _player = instance_place(x, y, Player);

if (_player != noone) {
	
    
	//for (var i = 0; i < instance_number(o_Checkpoint); i++){
	
//	var _instance = instance_find(o_Checkpoint, i);
	
//	if (_instance != self){
	//	_instance.sprite_index = Checkpoint_Idle;
//	}
//	else {
	//	_instance.sprite_index = Checkpoint;
	//}
	//}
	
	//audio_play_sound(sfx_Checkpoint, 10, false);
	//The sound played everytime i touched it, 
	//including if i was standing still on it
	
	sprite_index = Checkpoint;
	_player.original_x = x;
	_player.original_y = y;
	
}

