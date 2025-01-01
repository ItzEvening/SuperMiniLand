event_inherited();

var _left_collide = place_meeting(x - walksp, y, ground_tiles);
var _left_on_ground = place_meeting(x - walksp, y + 2, ground_tiles);
var _right_collide = place_meeting(x + walksp, y, ground_tiles);
var _right_on_ground = place_meeting(x + walksp, y + 2, ground_tiles);
		
if (!dead) {
	
	if (walk_direction == -1 and !_left_collide and _left_on_ground) {
		hsp = -walksp;
	}
	else if (walk_direction == 1 and !_right_collide and _right_on_ground) {
		hsp = walksp;
	}
	else {
		walk_direction *= -1;
		image_xscale *= -1;
		//audio_play_sound(sfx_Police_Siren,5,1);
	}
	
	
	if (!player_detected and !timer_running and distance_to_object(Player) < range) {
		player_detected = true;
		timer_running = true;
		time_source_start(siren_timer);
		audio_play_sound(sfx_Police_Siren, 5, 0);
	}
	else if (!timer_running and distance_to_object(Player) >= range) {
		player_detected = false;
	}
	
}
