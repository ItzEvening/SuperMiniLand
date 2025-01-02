// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayClear(){
	if (global.music == 1) {
		audio_play_sound(ClearE, 10, 0);
	}
	else {
		audio_play_sound(Clear, 10, 0);
	}
}