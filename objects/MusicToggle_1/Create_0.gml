sprite_m = MusicSelect_Mini;
sprite_8 = MusicSelect_8bit;
sprite_e = MusicSelect_Evie;
sprite_custom = MusicSelect_Custom;

if (room == Sound_Select) {
	audio_stop_all();
}

initialize = function() {
	if (global.music.custom) {
		sprite_index = sprite_custom;
	}
	
	else if (global.music.current == 0) {
		sprite_index = sprite_m;
	    //audio_play_sound(Sound_Test_M, 10, 0);
	}

	else if (global.music.current == 1) {
		sprite_index = sprite_8;
	   // audio_play_sound(Sound_Test_E, 10, 0);
	}
	else {
		sprite_index = sprite_e;
	}
}

asc = true;
initialize();