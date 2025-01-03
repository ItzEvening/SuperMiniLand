event_inherited();

spr_dead = CFiwDead;

die = function() {
	instance_destroy();
}

dead = false;
death_timer = time_source_create(time_source_game, 1, time_source_units_seconds, die);
walk_direction = -1;