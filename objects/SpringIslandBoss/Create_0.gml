event_inherited();

enum POLYSTATES {
	IDLE,
	WAITING,
	JUMPING,
	DRIVING
}

scale = 1.5;

left_bound = 800;
right_bound = 1600;

// drive variables
frict = 0.05;

// jump variables
dir = -1;
current_state = POLYSTATES.IDLE;

// decide hp
if (global.difficulty == 1) {
	hp = 9;
	hp_original = 9;
}

get_frame_index = function(_status) {
	switch(_status) {
		case BOSS_IDLE:
			return 0;
		case BOSS_HURT:
			return 2;
		case BOSS_DEAD:
			return 3;
	}
}

change_phase = function() {
	
	var phase1thresh = hp_original * 2 / 3;
	var phase2thresh = hp_original / 3;
	
	if (hp == phase1thresh) {
		phase = 1;
	}
	else if (hp == phase2thresh) {
		phase = 2;
	}
}

chose_attack = function() {
	if (dead) {
		return;
	}
	
	if ((x < left_bound + 96 or x > right_bound - 96) and global.difficulty > 0) {
		drive(x - 1200);
	}
	
	else {
		jump();
	}
	
}

end_attack = function() {
	current_state = POLYSTATES.WAITING;
	time_source_start(attack_timer);
	sprite_index = SICarIdle;
}

jump = function() {
	current_state = POLYSTATES.JUMPING;
		
	switch (phase) {
		case 0:
			vsp = -10;
		break;
			
		case 1:
			vsp = -7;
		break;
			
		default:
			vsp = -15;
		break;
	}
		
	sprite_index = SICarFly;
		
	// decide jump direction
	var _player = instance_find(Player, 0);
	var _ground_tiles = layer_tilemap_get_id("Foreground_Tiles");
	if (_player != noone) {
			
		if (_player.x < x) {
			dir = -1;
		}
		else {
			dir = 1;
		}
			
		image_xscale = dir * -1 * scale;
			
		// if colliding during new direction
		//while(place_meeting(x, y, _ground_tiles)) {
		//	x += dir;
		//}
	}
	
}
	
drive = function(dist_from_middle) {
	current_state = POLYSTATES.DRIVING;
	move = -1 * sign(dist_from_middle);
	dir = move;
}

jump_step = function(_onGround) {
	if (!_onGround) {	
		switch (phase) {
			case 0:
				hsp = 3 * dir;
			break;
		
			case 1:
				hsp = 6 * dir;
			break;
		
			default:
				hsp = 4 * dir;
			break;
		}
	}
	
	// end attack
	else {
		end_attack();
	}
}

drive_step = function() {
	
	var right_end = dir == 1 and x > 1300;
	var left_end = dir == -1 and x < 1100;		
	
	if (left_end or right_end) {
		move = 0;
		end_attack();
	}
}

attack_timer = time_source_create(time_source_game, 1, time_source_units_seconds, chose_attack);