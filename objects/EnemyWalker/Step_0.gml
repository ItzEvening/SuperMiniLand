event_inherited();

var _left_collide = meeting_solid(x - walk_sp, y);
var _left_on_ground = meeting_solid(x - walk_sp - rad, y + sign(grv)) or !dont_fall;
var _right_collide = meeting_solid(x + walk_sp, y);
var _right_on_ground = meeting_solid(x + walk_sp + rad, y + sign(grv)) or !dont_fall;

if (!dead) {
	
	var should_turn = dont_fall or _left_collide or _right_collide;
	
	if (walk_direction == -1 and !_left_collide and _left_on_ground) {
		hsp = -1 * walk_sp;
	}
	else if (walk_direction == 1 and !_right_collide and _right_on_ground) {
		hsp = walk_sp;
	}
	else if (should_turn and meeting_solid(x, y + sign(grv))) {
		walk_direction *= -1;
		image_xscale *= -1;
	}
}
