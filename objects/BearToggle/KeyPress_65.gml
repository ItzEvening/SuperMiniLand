if (enable_toggle and Demo_Level_Select.control) {
	global.bear = !global.bear;
	Demo_Level_Select.update();
	
	if (!global.bear) {
		audio_play_sound(sfx_Jump, 10, 0);
		image_index = 1;
	}
	else {
		audio_play_sound(sfx_Jump3, 10, 0);
		image_index = 2;
	}
}