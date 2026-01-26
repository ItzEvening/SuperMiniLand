ChangeSize(1200, 880);

if (global.music.current == 0) {
	audio_play_sound(Challenge_Lose_ThemeM,10,0);
}
else if (global.music.current == 1) {
	audio_play_sound(Challenge_Lose_Theme,10,0);
}
else if (global.music.current == 2) {
	audio_play_sound(Challenge_Lose_ThemeE,10,0);
}



