/// @description Music toggle
if (Demo_Level_Select.control) {
	
	if (global.music == 0) {
		global.music = 1;
		sprite_index = MusicV;
		audio_play_sound(ESides, 10, 0);
	}
	else {
		global.music = 0;
		sprite_index = MusicM;
		audio_play_sound(MSides, 10, 0);
	}
	
}

