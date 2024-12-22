var _proceed = false;

if (keyboard_check_pressed(ord("R")) and status == 0) {
	sprite_index = reset1;
	_proceed = true;
	audio_stop_all();
	audio_play_sound(reset_sound1, 10, 1);
}
else if (keyboard_check_pressed(ord("E")) and status == 1) {
	sprite_index = reset2;
	_proceed = true;
}
else if (keyboard_check_pressed(ord("S")) and status == 2) {
	sprite_index = reset3;
	_proceed = true;
}
else if (keyboard_check_pressed(ord("E")) and status == 3) {
	sprite_index = reset4;
	_proceed = true;
}
else if (keyboard_check_pressed(ord("T")) and status == 4) {
	sprite_index = reset5;
	_proceed = true;
	audio_stop_all();
	audio_play_sound(reset_sound2, 10, 1);
}
else if (keyboard_check_pressed(vk_enter) and status == 5) {
	_proceed = true;
}

if (_proceed and status < 5) {
	status++;
}
else if (_proceed) {
	audio_stop_all();
	file_delete("save");
	ds_map_destroy(global.savedata);
	game_restart();
}
else {
	audio_stop_all();
	room_goto(Main_Menu);
}