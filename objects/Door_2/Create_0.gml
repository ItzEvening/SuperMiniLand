teleport = function() {
	if(place_meeting(x, y, Player)) {
	SlideTransition(TRANS_MODE.LEVEL, Level_Card_Starlight);
    global.level = target;	
	}
}

teleport_timer = time_source_create(time_source_global, 1.5, time_source_units_seconds, teleport);