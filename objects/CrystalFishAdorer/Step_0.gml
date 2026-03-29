event_inherited();

var dx = Player.x - x;
var dy = Player.y - y;

var hypo = sqrt(dx * dx + dy * dy);

if (hypo < 250) {
	dx *= swim_speed / hypo;
	dy *= swim_speed / hypo;
	
	if (place_meeting(x + dx, y + dy, water_tiles)) {
		x += dx;
		y += dy;
	}
}