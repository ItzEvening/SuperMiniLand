if (global.music == 0) {
	audio_play_sound(song_CreditsM,1,0);
}

else if (global.music == 1) {
	audio_play_sound(song_Credits,1,0);
}

else {
	audio_play_sound(song_CreditsE,1,0);
}
