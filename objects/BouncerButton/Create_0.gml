pressable = true;

reset = function() {
	pressable = true;
}

reset_timer = time_source_create(time_source_global, 2.0, time_source_units_seconds, reset);