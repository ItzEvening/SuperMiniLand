event_inherited();

spr_dead = GarDead;
sfx_dead = EnemyDefeat;
killable = true;

die = function() {
	instance_destroy();
}

dead = false;
death_timer = time_source_create(time_source_game, 1, time_source_units_seconds, die);