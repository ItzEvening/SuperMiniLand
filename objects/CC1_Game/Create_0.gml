evie = instance_find(Evie, 0);
if (evie != noone) {
	evie.left_barrier.x = 512 + 32;
	evie.right_barrier.x = 1376 - 32;
}

spawn = function() {
	var _dir = 2 * irandom(1) - 1;
	var _path = path_CC1;
	var _y = irandom_range(417, 576);
	var _sp = random_range(0.5, 1.25);
	
	var _x = 0;
	if (_dir == -1) {
		_x = 1376 + 512;
	}
	
	var _enemy = instance_create_layer(_x, _y, "Enemies", CC1_Barry, {
		path_sp : _sp * _dir,
		chosen_path : _path
	});
}

spawn_timer = time_source_create(time_source_global, 5, time_source_units_seconds, spawn, [], -1);
time_source_start(spawn_timer);