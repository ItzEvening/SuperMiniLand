fired = false;

reset = function() {
	fired = false;
}

reset_timer = time_source_create(time_source_global, reset_time, time_source_units_seconds, reset);