event_inherited();

die = function() {
	instance_destroy();
}

dead = false;
death_timer = time_source_create(time_source_game, 1, time_source_units_seconds, die);
walk_direction = -1;
walksp = 7;



player_detected = false;
timer_running = false;
range = 400;

activate_siren = function() {
	
	timer_running = false;
}

siren_timer = time_source_create(time_source_global, 2, time_source_units_seconds, activate_siren);