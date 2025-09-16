image_speed = 0;

begin_cycle = function() {
	time_source_start(pour_timer);
}

pour = function() {
	sprite_index = spr_Barrel_Pour;
	image_speed = 1;
}

wait_timer = time_source_create(time_source_global, delay, time_source_units_seconds, begin_cycle);
pour_timer = time_source_create(time_source_global, period, time_source_units_seconds, pour, [], -1);

time_source_start(wait_timer);