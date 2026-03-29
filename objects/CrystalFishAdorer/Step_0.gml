event_inherited();

var dx = Player.x - x;
var dy = Player.y - y;

var hypo = sqrt(dx * dx + dy * dy);

// following player
if (hypo < 250) {
	dx *= swim_speed / hypo;
	dy *= swim_speed / hypo;
	
	if (place_meeting(x + dx, y + dy + (height * sign(dy)), water_tiles)) {
		x += dx;
		y += dy;
		
		image_xscale = -1 * sign(dx);
	}
}

// swimming idly
else {
	var xgood = x >= xinterest and x < xinterest + 16;
	var ygood = y >= yinterest and y < yinterest + 16;
	
	// arrived!!!
	if (xgood and ygood) {
		xinterest = xoriginal + random_range(-1 * habitat_radius, habitat_radius);
		yinterest = yoriginal + random_range(-1 * habitat_radius, habitat_radius);
		
	}
	
	// not arrived
	else {
		var xtarget = xinterest + 8 + random_range(-2, 2);
		var ytarget = yinterest + 8 + random_range(-2, 2);
		
		dx = xtarget - x;
		dy = ytarget - y;
		hypo = sqrt(dx * dx + dy * dy);
		
		dx *= idle_speed / hypo;
		dy *= idle_speed / hypo;	
		
		x += dx;
		y += dy;
		
		image_xscale = -1 * sign(dx);
	}
	
	
}