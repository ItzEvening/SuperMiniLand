teleport = function() {
	if(place_meeting(x, y, Player)) {
		Player.x = newX;
		Player.y = newY;
		
		custom_logic();
	}
}

custom_logic = function() {
	// TO BE OVERWRITTEN
}

teleport_timer = time_source_create(time_source_global, 1.2, time_source_units_seconds, teleport);