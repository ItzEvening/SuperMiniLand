kill_block = function() {
	audio_play_sound(break_sound,10,0);
	instance_destroy();
}

break_sound = sfx_BlockDrill;