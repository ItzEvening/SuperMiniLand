event_inherited();

die = function() {
	instance_destroy();
}
jump = function() {
	if (place_meeting(x,y+1,ground_tiles) and !dead) {
		vsp = -7;
		sprite_index = BarFly;
		jumped = true;
		
		// decide jump direction
		var _player = instance_find(Player, 0);
		if (_player != noone) {
			
			if (_player.x < x) {
				jump_direction = -1;
			}
			else {
				jump_direction = 1;
			}
			
			image_xscale = jump_direction * -1;
		}
	}
}

dead = false;
death_timer = time_source_create(time_source_game, 1, time_source_units_seconds, die);
jumped = false;
jump_timer = time_source_create(time_source_game, 1, time_source_units_seconds, jump);

jump_direction = 1;