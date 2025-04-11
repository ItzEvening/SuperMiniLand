/// @description Music toggle
if (global.menu_control) {
	
	if (global.music == 0) {
		//global.music = 1;
	    sprite_index = Evie_Music;
        //audio_play_sound(Sound_Test_E, 10, 0);
	}
	else {
		//global.music = 0;
		sprite_index = Mini_Music;
		//audio_play_sound(Sound_Test_M, 10, 0);
	}
	
}

