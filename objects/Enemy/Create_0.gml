event_inherited();

spr_dead = GarDead;
sfx_dead = EnemyDefeat;
killable = true;
collide_on_death = true;
score_giver = false;
rot = true;

die = function() {
	if (rot) {
		instance_destroy();
	}
}

dead = false;
death_timer = time_source_create(time_source_game, 1, time_source_units_seconds, die);


good_to_kill = function(_player) {
	return _player.y < bbox_top and 
	!dead and 
	_player.vsp > -3 and 
	killable and
	!place_meeting(x, y, o_Forcefield);
}