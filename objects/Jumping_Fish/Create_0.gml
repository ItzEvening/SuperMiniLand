event_inherited();

obey_collisions = false;
killable = false;

spawn_x = x;
spawn_y = y;

spawn = function() {
	x = spawn_x;
	y = spawn_y;
	
	vsp = jump_speed;
	time_source_start(spawn_timer);
}

spawn_timer = time_source_create(time_source_global, period, time_source_units_seconds, spawn);

wait = function() {
	time_source_start(spawn_timer);
}

wait_timer = time_source_create(time_source_global, delay, time_source_units_seconds, wait);

time_source_start(wait_timer);