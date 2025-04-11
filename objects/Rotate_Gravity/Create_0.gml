active = true;

cooldown = function() {
	active = true;
}

cooldown_timer = time_source_create(time_source_global, 0.5, time_source_units_seconds, cooldown)