event_inherited();

var dx = x - Player.x;
var dy = y - Player.y;

var dx_good = abs(dx) < 350;
var dy_good = dy < 96 and dy > -128;

var onground = place_meeting(x, y + sign(grv), ground_tiles) or place_meeting(x, y + sign(grv), SolidObject);

if (!following and dx_good and dy_good) {
	following = true;
	dont_fall = false;
}

else if (following and !dx_good and !dy_good) {
	following = false;
	dont_fall = true;
}

if (following and Player.x > x + 32 and onground) {
	image_xscale = -1;
	walk_direction = 1;	
}

else if (following and Player.x < x - 32 and onground) {
	image_xscale = 1;
	walk_direction = -1;
}