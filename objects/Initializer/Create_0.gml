// initialize global variables
global.music = 0;
global.level = OldSpringIsland_1;
global.character = Mini;
global.bear = false;
global.rainbow_progress = [];
global.menu_control = true;

// handle save data
if (!file_exists("save")) {
	global.savedata = ds_map_create();
}
else {
	global.savedata = ds_map_secure_load("save");
}

CheckSave();
	
ds_map_secure_save(global.savedata, "save");
ds_map_destroy(global.savedata);
	
global.savedata = ds_map_secure_load("save");

JamSam = function(){
	SlideTransition(TRANS_MODE.GOTO, Main_Menu);
}

HamSam = function(){
	SlideTransition(TRANS_MODE.GOTO, Splash_Screen_2);
	time_source_start(splash_timer2);
}

splash_timer = time_source_create(time_source_global, 640, time_source_units_frames, HamSam);
splash_timer2 = time_source_create(time_source_global, 7, time_source_units_seconds, JamSam);

time_source_start(splash_timer);

randomize();


