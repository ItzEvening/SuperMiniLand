if (Player.x > x) {
	
	if (global.music == 0) {
		MusicPlayer.play_music(BossTheme);
	}
	else {
		MusicPlayer.play_music(BossThemeE);
	}
	
	// 10 tiles back
	var _offset = 10 * 32;
	
	SpringIslandBoss.left_barrier.x = x - _offset;
	Player.left_barrier.x = x - _offset;
	Camera.change_left_border(x - _offset);
	
	Player.original_x = x;
	Player.original_y = y;
	 
	instance_destroy();
}