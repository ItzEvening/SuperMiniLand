event_inherited();

dead = false;
state = 0;
hp = 6;
invincible = false;
scale = 1.5;
phase = 0;

// jump variables
jumped = false;
jump_direction = 1;

recover = function() {
	invincible = false;
	state = 0;
}

end_fight = function() {
	with (Player)
	{
		if (hascontrol)
		{
			hascontrol = false;
			SlideTransition(TRANS_MODE.GOTO, Demo_End);

		}
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

change_phase = function() {
	if (hp == 4) {
		phase = 1;
	}
	else if (hp == 2) {
		phase = 2;
	}
}

invincible_timer = time_source_create(time_source_global, 1.5, time_source_units_seconds, recover);
end_timer = time_source_create(time_source_global, 2.5, time_source_units_seconds, end_fight);
jump_timer = time_source_create(time_source_game, 1, time_source_units_seconds, jump);