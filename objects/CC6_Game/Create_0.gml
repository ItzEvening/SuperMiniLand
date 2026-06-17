respawn = function() {
	global.lo.send(RESPAWN_CC6_LIFT,);
}

global.lo.add(self, PLAYER_DEATH, respawn);

too_slow_restart = function() {
	Player.x = Player.original_x;
	Player.y = Player.original_y;
	global.lo.send(RESPAWN_CC6_LIFT);
	MusicPlayer.play_music();
	restarting = false;
}

restart_timer = time_source_create(time_source_global, 3, time_source_units_seconds, too_slow_restart);
restarting = false;

too_slow = function() {
	MusicPlayer.stop_music();
	audio_play_sound(sfx_MissionFailed, 10, 0);
	time_source_start(restart_timer);
	restarting = true;
}