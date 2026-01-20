/// @description Music toggle
if (global.menu_control) {
	
	if (global.music == 0) {
		global.music = 1;
	    sprite_index = sprite_8;
		
		if (asc) {
			audio_play_sound(sfx_MusRoom_8bit_asc, 10, 0);
		} else {
			audio_play_sound(sfx_MusRoom_8bit_desc, 10, 0);
		}
	}

	else if (global.music == 1) {
		global.music = 2;
	    sprite_index = sprite_e;
		
		if (asc) {
			audio_play_sound(sfx_MusRoom_Evie_asc, 10, 0);
		} else {
			audio_play_sound(sfx_MusRoom_Evie_desc, 10, 0);
		}
	}
	
	else if (global.music == 2) {
		global.music = 0;
	    sprite_index = sprite_m;
		
		if (asc) {
			audio_play_sound(sfx_MusRoom_Mini_asc, 10, 0);
		} else {
			audio_play_sound(sfx_MusRoom_Mini_desc, 10, 0);
		}
	}
	
}

global.lo.send(MUSIC_CHANGE, global.music);
asc = !asc;