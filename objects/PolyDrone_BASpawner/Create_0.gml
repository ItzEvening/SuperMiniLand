num_drones_tame = 5;
num_drones_hard = 10;
num_drones = num_drones_tame;
y_range = 32 * 5;

slow_sp = 1.5;
fast_sp = 3;

spawn = function(_speed) {
	
	var y_spawn = irandom_range(y - y_range, y);
	var drone = instance_create_layer(x, y_spawn, layer, PolyDrone_BA);
	
	if (drone != noone) {
		drone.flysp = _speed;
	}
}

spawn_timer = time_source_create(time_source_global, 2, time_source_units_seconds, spawn, [slow_sp], num_drones);
spawn_timer_overclock = time_source_create(time_source_global, 1.5, time_source_units_seconds, spawn, [fast_sp], num_drones_hard);

trigger = function(overclocked) {
	
	if (overclocked) {
		num_drones = num_drones_hard;
		time_source_start(spawn_timer_overclock);
	}
	
	else {
		num_drones = num_drones_tame;
		time_source_start(spawn_timer);
	}
	
}