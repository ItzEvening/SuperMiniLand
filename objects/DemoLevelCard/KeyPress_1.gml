if (keyboard_check_pressed(vk_left) and global.menu_control) {
	increment(-1);
}
else if (keyboard_check_pressed(vk_right) and global.menu_control) {
	increment(1);
}
else if (keyboard_check_pressed(trigger_key) and access[index] and global.menu_control) {
	
	determine_character();
	
	SlideTransition(TRANS_MODE.LEVEL, Level_Card);
	global.level = levels[index];
}