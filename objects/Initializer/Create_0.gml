// initialize global variables
global.music = 0;
global.level = SpringIsland_1;
global.character = Mini;
global.bear = false;

// handle save data
if (!file_exists("save")) {
	global.savedata = ds_map_create();
	
	global.savedata[? "spring"] = [false, false, false, false, false];
	global.savedata[? "salmon"] = [false, false, false, false, false];
	global.savedata[? "secret"] = [false, false, false, false, false, false, false, false];
	
	global.savedata[? "boss unlocked"] = false;
	global.savedata[? "secret accessed"] = false;
	
	ds_map_secure_save(global.savedata, "save");
	ds_map_destroy(global.savedata);
	
	global.savedata = ds_map_secure_load("save");
}
else {
	global.savedata = ds_map_secure_load("save");
}

function HamSam(){
	SlideTransition(TRANS_MODE.GOTO, Splash_Screen_2);
}

splash_timer = time_source_create(time_source_global, 180, time_source_units_frames, HamSam);

time_source_start(splash_timer);

function JamSam(){
	SlideTransition(TRANS_MODE.GOTO, Main_Menu);
}

splash_timer2 = time_source_create(time_source_global, 350, time_source_units_frames, JamSam);

time_source_start(splash_timer2);



