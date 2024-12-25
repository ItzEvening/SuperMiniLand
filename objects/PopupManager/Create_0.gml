draw_notification = false
sprite = PolyAlert;
save = "boss unlocked"

kill_notif = function() {
	draw_notification = false;
	MusicPlayer.play_music(Demo_Menu_Test);
	Demo_Level_Select.control = true;
	
	global.savedata[? save] = true;
	ds_map_secure_save(global.savedata, "save");
}

notify = function(_sprite, _save) {
	
	Demo_Level_Select.control = false;
	audio_stop_all();
	audio_play_sound(Clear, 10, 0);
	draw_notification = true;
	
	var _timer = time_source_create(time_source_global, 7.55, time_source_units_seconds, kill_notif);
	time_source_start(_timer);
	
	sprite = _sprite;
	save = _save;
	
}