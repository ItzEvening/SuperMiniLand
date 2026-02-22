pressable = true;
idle_sprite = spr_BouncerButton_Idle;
press_sprite = spr_BouncerButton_Press;

reset = function() {
	pressable = true;
}

reset_timer = time_source_create(time_source_global, 2.0, time_source_units_seconds, reset);