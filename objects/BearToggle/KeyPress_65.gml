if (secret_gems == 8) {
	global.bear = !global.bear;
	
	if (!global.bear) {
		audio_play_sound(sfx_Jump, 10, 0);
	}
	else {
		audio_play_sound(sfx_Jump3, 10, 0);
	}
}