event_inherited();

die = function() {
	instance_destroy();
}
jump = function() {
	_inrange = distance_to_object(Player) < 250;
	
	//The Supernatual ...for Final Chase
	
	
	
	if (place_meeting(x,y+1,ground_tiles) and !dead and _inrange) {
		vsp = -3;
		sprite_index = LarFly;
		jumped = true;
		
		// decide jump direction
		var _player = instance_find(Player, 0);
		var _ground_tiles = layer_tilemap_get_id("Foreground_Tiles");
		if (_player != noone) {
			
			if (_player.x < x) {
				jump_direction = -1;
			}
			else {
				jump_direction = 1;
			}
			
			image_xscale = jump_direction * -1;
			
			// if colliding during new direction
			while(place_meeting(x, y, _ground_tiles)) {
				x += jump_direction;
			}
		}
	}
}

dead = false;
death_timer = time_source_create(time_source_game, 1, time_source_units_seconds, die);
jumped = false;
jump_timer = time_source_create(time_source_game, 1, time_source_units_seconds, jump);

jump_direction = 1;