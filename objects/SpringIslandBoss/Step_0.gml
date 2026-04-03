event_inherited();

var _onGround = place_meeting(x,y+1,ground_tiles);

if (current_state == POLYSTATES.IDLE and BossStarter.activated) {
	current_state = POLYSTATES.WAITING;
	time_source_start(attack_timer);
}

switch current_state {
	case POLYSTATES.JUMPING:
		jump_step(_onGround);
		break;
	
	case POLYSTATES.DRIVING:
		drive_step();
		break;
}