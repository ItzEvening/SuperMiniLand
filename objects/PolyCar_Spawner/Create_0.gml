spawn = function() {
	
	if (spawn_active) {
		instance_create_layer(x, y, layer, PolyCar_CC4, {
			die_x: die_x
		});
	}
}

spawn_timer = time_source_create(time_source_global, 0.25, time_source_units_seconds, spawn, [], -1);

time_source_start(spawn_timer);
