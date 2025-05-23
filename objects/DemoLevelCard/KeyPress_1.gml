var _card_data = metas[index];

if (keyboard_check_pressed(vk_left) and global.menu_control) {
	increment(-1);
}
else if (keyboard_check_pressed(vk_right) and global.menu_control) {
	increment(1);
}
else if (keyboard_check_pressed(trigger_key) and script_execute(_card_data.requirement) and global.menu_control) {
	
	determine_character();
	
	if (_card_data.lvl == Blank_Canvas) {
		SlideTransition(TRANS_MODE.GOTO, Blank_Canvas);
	}
	else {
		SlideTransition(TRANS_MODE.LEVEL, Level_Card);
		global.level = _card_data.lvl;
	}
}