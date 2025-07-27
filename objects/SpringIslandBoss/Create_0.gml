event_inherited();

scale = 1.5;

// jump variables
jumped = false;
jump_direction = 1;

get_frame_index = function(_status) {
	switch(_status) {
		case BOSS_IDLE:
			return 0;
		case BOSS_HURT:
			return 2;
		case BOSS_DEAD:
			return 3;
	}
}

jump = function() {
	
	var _starter = instance_find(BossStarter, 0);
	var _starter_triggered = _starter != noone and _starter.activated;
	
	if (place_meeting(x,y+1,ground_tiles) and !dead and _starter_triggered) {
		
		switch (phase) {
			case 0:
				vsp = -10;
			break;
			
			case 1:
				vsp = -7;
			break;
			
			default:
				vsp = -15;
			break;
		}
		
		sprite_index = SICarFly;
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
			
			image_xscale = jump_direction * -1 * scale;
			
			// if colliding during new direction
			while(place_meeting(x, y, _ground_tiles)) {
				x += jump_direction;
			}
		}
	}
}

jump_timer = time_source_create(time_source_game, 1, time_source_units_seconds, jump);