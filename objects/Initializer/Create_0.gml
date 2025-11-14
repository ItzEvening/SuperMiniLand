// initialize global variables
global.music = 0;
global.level = OldSpringIsland_1;
global.character = Mini;
global.bear = false;
global.rainbow_progress = [];
global.menu_control = true;
global.score = 0;
global.lo = new SignalController();

// TO BE CHANGED FOR RELEASE
global.dev_mode = false;
landing_point = Main_Menu;

// handle save data
save_file = "save";
if (!file_exists("save") or global.dev_mode) {
	global.savedata = ds_map_create();
}
else {
	global.savedata = ds_map_secure_load("save");
}

if (global.dev_mode) {
	DevSave();
	save_file = "save_dev";
}
else {
	CheckSave();
}
	
WriteSaveFile();

ds_map_destroy(global.savedata);
global.savedata = ds_map_secure_load(save_file);


JamSam = function(){
	SlideTransition(TRANS_MODE.GOTO, landing_point);
}

HamSam = function(){
	SlideTransition(TRANS_MODE.GOTO, Splash_Screen_2);
	time_source_start(splash_timer2);
}

timer_length_1 = 600;
timer_length_2 = 7;


if (global.dev_mode) {
	timer_length_1 = 30;
	timer_length_2 = 0.5;
}

splash_timer = time_source_create(time_source_global, timer_length_1, time_source_units_frames, HamSam);
splash_timer2 = time_source_create(time_source_global, timer_length_2, time_source_units_seconds, JamSam);

time_source_start(splash_timer);

randomize();


