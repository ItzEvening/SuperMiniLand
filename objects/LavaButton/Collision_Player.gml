if (pressable) {
	sprite_index = spr_LavaButton_Press;
	pressable = false;
	audio_play_sound(BlockBreak, 10, 0);
	
	var _a = GetSave(SV_EDGE_ARC);
	SetSave(SV_EDGE_ARC, !_a);
	
	global.lo.send(ARTY_CHANGE, 0);
	
	time_source_start(reset_timer);
}