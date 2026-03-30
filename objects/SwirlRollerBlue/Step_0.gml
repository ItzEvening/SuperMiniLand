event_inherited();

var ygood = Player.y > y and Player.y < y + 32 * 5;

if (sign(grv) < 0 and abs(Player.x - x) < 150 and ygood) {
	grv *= -1;
	image_yscale = 1;
	dont_fall = false;
}