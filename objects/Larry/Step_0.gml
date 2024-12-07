event_inherited();

var _onGround = place_meeting(x,y+1,ground_tiles);
var _timerInactive = time_source_get_state(jump_timer) != time_source_state_active;

if (_onGround and _timerInactive and !dead) {
	time_source_start(jump_timer);
	jumped = false;
	sprite_index = LarIdle;
}

if (jumped && !_onGround) {
	hsp = 7 * jump_direction;
}