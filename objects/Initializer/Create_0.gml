// initialize global variables
global.music = 0;
global.level = SpringIsland_1;
global.character = Mini;
global.bear = false;

function HamSam(){
	SlideTransition(TRANS_MODE.GOTO, Main_Menu);
}

splash_timer = time_source_create(time_source_global, 180, time_source_units_frames, HamSam);

time_source_start(splash_timer);