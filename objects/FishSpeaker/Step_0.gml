event_inherited();

var _left_collide = place_meeting(x - 2, y, ground_tiles);
var _left_on_ground = place_meeting(x - 2, y + 1, ground_tiles);
var _right_collide = place_meeting(x + 2, y, ground_tiles);
var _right_on_ground = place_meeting(x + 2, y + 1, ground_tiles);

if (!dead) {
	
	if (walk_direction == -1 and !_left_collide and _left_on_ground) {
		hsp = -2;
	}
	else if (walk_direction == 1 and !_right_collide and _right_on_ground) {
		hsp = 2;
	}
	else {
		walk_direction *= -1;
		image_xscale *= -1;
	}
}
