pressable = true;
idle_sprite = spr_PianoWhiteButton_Idle;
press_sprite = spr_PianoWhiteButton_Press;


reset = function() {
	pressable = true;
}

reset_timer = time_source_create(time_source_global, 1.0, time_source_units_seconds, reset);