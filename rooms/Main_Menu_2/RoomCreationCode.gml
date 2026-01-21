if (global.music == 0) {
	audio_play_sound(MainMusic4M, 10, 0);
} 
else if (global.music == 2) {
	audio_play_sound(MainMusic4E, 10, 0);
}
else {
	audio_play_sound(MainMusic4, 10, 0);
}

ChangeSize(1200, 880);