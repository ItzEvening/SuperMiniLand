spr = A_Indicator_Good;

show = function(_status) {
	
	switch (_status) {
		case ALLIE_GOOD:
			spr = A_Indicator_Good;   
			break;
			
		case ALLIE_OFF_BALANCE:
			spr = A_Indicator_OffBalance;
			break;
			
		case ALLIE_TOO_ROUGH:
			spr = A_Indicator_Harsh;
			break;
			
		case ALLIE_BAD:
			spr = A_Indicator_Bad;
			break;
	}
	
	visible = true;
	image_index	= 0;
	
	if (time_source_get_state(hide_timer) == time_source_state_active) {
		time_source_stop(hide_timer);
	}
	else {
		time_source_start(hide_timer);
	}
	
}

hide = function() {
	visible = false;
}

hide_timer = time_source_create(time_source_global, 0.59, time_source_units_seconds, hide);

global.lo.add(self, ALLIE_KILL, show);