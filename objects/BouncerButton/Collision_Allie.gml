if (pressable and Allie.done_gimmick) {
	sprite_index = press_sprite;
	pressable = false;
	audio_play_sound(BlockBreak, 10, 0);
	
	global.lo.send(SEND_BOUNCER,);
	
	time_source_start(reset_timer);
}