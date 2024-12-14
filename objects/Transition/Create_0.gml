//w = display_get_gui_width();
//h = display_get_gui_height();
w = view_wport[0];
h = view_hport[0];
h_half = h * 0.5;
enum TRANS_MODE
{
   OFF,
   NEXT,
   GOTO,
   RESTART,
   INTRO,
   LEVEL
}
mode = TRANS_MODE.OFF;
percent = 1.2;
target = room;
show_debug_message(w);
//Paste this in transition's create event

function stop_music() {
	if (instance_exists(MusicPlayer)) {
		MusicPlayer.stop_music();
	}
}

function stop_underwater() {
	if (instance_exists(MusicPlayer)) {
		MusicPlayer.underwater_effect(true);
	}
}