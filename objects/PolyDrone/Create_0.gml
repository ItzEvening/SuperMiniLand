dead = false;
p_speed = 4;
x_prev = x;
path_start(Path1, p_speed, path_action_reverse, false);

die = function() {
	instance_destroy();
}
death_timer = time_source_create(time_source_game, 1, time_source_units_seconds, die);