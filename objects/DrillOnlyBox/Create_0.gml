kill_block = function() {
	audio_play_sound(BlockBreak,10,0);
	instance_destroy();
}