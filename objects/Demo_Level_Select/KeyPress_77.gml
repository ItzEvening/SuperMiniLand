/// @description Music toggle

if (!variable_global_exists("music") or global.music == 0) {
	global.music = 1;
	audio_play_sound(ESides, 10, 0);
}
else {
	global.music = 0;
	audio_play_sound(MSides, 10, 0);
}