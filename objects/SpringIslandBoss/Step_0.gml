event_inherited();

var _onGround = place_meeting(x,y+1,ground_tiles);

if (dead and !obey_gravity) {
	obey_gravity = true;
	hsp = 0;
}

// play thud sound effect
if (dothud and _onGround) {
	audio_play_sound(sfx_Thud, 10, false);
	dothud = false;
	global.lo.send(TOGGLE_SHAKE, true);
	time_source_start(shake_timer);
}

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
		
	case POLYSTATES.FLYING:
		fly_step();
		break;
}
