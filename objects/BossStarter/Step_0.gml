if (!activated and Player.x > x) {
	
	audio_stop_all();
	
	if (global.music.current == 0) {
		MusicPlayer.play_music(theme_m);
	}
	else if (global.music.current == 1) {
		MusicPlayer.play_music(theme_8);
	}
	else if (global.music.current == 2) {
		MusicPlayer.play_music(theme_e);
	}
	
	// 10 tiles back
	var _offset = tiles_back * 32;
	
	boss_object.left_barrier.x = x - _offset;
	Player.left_barrier.x = x - _offset;
	Camera.change_left_border(x - _offset);
	
	Player.original_x = x;
	Player.original_y = y;
	
	activated = true;
	
	global.lo.send(BOSS_STARTED, 0);
}