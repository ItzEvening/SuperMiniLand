event_inherited();

var _onGround = place_meeting(x,y+1,ground_tiles);
var _timerInactive = time_source_get_state(jump_timer) != time_source_state_active;

if (_onGround and _timerInactive and !dead) {
	time_source_start(jump_timer);
	jumped = false;
	sprite_index = SICarIdle;
}

if (jumped && !_onGround) {	
	switch (phase) {
		case 0:
			hsp = 3 * jump_direction;
		break;
		
		case 1:
			hsp = 6 * jump_direction;
		break;
		
		default:
			hsp = 4 * jump_direction;
		break;
	}
	
}