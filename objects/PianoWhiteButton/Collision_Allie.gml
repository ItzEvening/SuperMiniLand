if (pressable and Allie.done_gimmick) {
	sprite_index = press_sprite;
	pressable = false;
	audio_play_sound(sfx_ButtonClick, 10, 0);
	audio_play_sound(note, 10, 0);
	
	time_source_start(reset_timer);
}