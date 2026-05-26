if (!controllable) {
	exit;
}

if (back_selected) {
	SlideTransition(TRANS_MODE.CHAR_SELECT, Demo_Menu);
}


else if (!selections[index].locked and !selected) {
	selected = true;
	audio_stop_all();
	audio_play_sound(sfx_Pause_2, 10, false);
	global.character = DemoMenuState.chars[index];
	selections[index].chose();
}