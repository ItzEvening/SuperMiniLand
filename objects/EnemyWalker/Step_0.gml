event_inherited();

var _left_collide = place_meeting(x - 4.5, y, ground_tiles);
var _left_on_ground = place_meeting(x - 4.5, y + sign(grv), ground_tiles) or !dont_fall;
var _right_collide = place_meeting(x + 4.5, y, ground_tiles);
var _right_on_ground = place_meeting(x + 4.5, y + sign(grv), ground_tiles) or !dont_fall;

if (!dead) {
	
	var should_turn = dont_fall or _left_collide or _right_collide;
	
	if (walk_direction == -1 and !_left_collide and _left_on_ground) {
		hsp = -1 * walk_sp;
	}
	else if (walk_direction == 1 and !_right_collide and _right_on_ground) {
		hsp = walk_sp;
	}
	else if (should_turn and place_meeting(x, y + sign(grv), ground_tiles)) {
		walk_direction *= -1;
		image_xscale *= -1;
	}
}
