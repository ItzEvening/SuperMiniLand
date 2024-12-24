var _count = 0;

var _spring = global.savedata[? "spring"];
var _salmon = global.savedata[? "salmon"];
draw_notification = false;

kill_notif = function() {
	draw_notification = false;
	MusicPlayer.play_music(Demo_Menu_Test);
	Demo_Level_Select.control = true;
	
	global.savedata[? "boss unlocked"] = true;
	ds_map_secure_save(global.savedata, "save");
}

// count the amount of rainbow gems
for (var i = 0; i < ds_list_size(_spring); i++) {
	if (_spring[| i]) {
		_count++;
	}
}
for (var i = 0; i < ds_list_size(_salmon); i++) {
	if (_salmon[| i]) {
		_count++;
	}
}

image_index = _count;

if (_count == 10) {
	Demo_Level_Select.unlock();
	
	if (!global.savedata[? "boss unlocked"]) {
		
		Demo_Level_Select.control = false;
		audio_stop_all();
		audio_play_sound(Clear, 10, 0);
		draw_notification = true;
	
		var _timer = time_source_create(time_source_global, 7.55, time_source_units_seconds, kill_notif);
		time_source_start(_timer);
		
	}

}