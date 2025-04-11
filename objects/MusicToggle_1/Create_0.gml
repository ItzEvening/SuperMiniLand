if (global.music == 0) {
	audio_stop_all()
	sprite_index = Mini_Music;
    //audio_play_sound(Sound_Test_M, 10, 0);
}

else {
	audio_stop_all()
	sprite_index = Evie_Music;
   // audio_play_sound(Sound_Test_E, 10, 0);
}
