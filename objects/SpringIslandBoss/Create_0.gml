event_inherited();

enum POLYSTATES {
	IDLE,
	WAITING,
	JUMPING,
	DRIVING,
	FLYING
}

enum FLYSTATES {
	NOT,
	BASIC
}

scale = 1.5;
spr_width = 64 * scale;

left_bound = 800 + spr_width / 2;
right_bound = 2016 - spr_width / 2;

fly_tick = -1;
fly_tick_target = 5; 
fly_x_target = 0;
fly_y_target = 0;
fly_xrange = 256;
fly_y_target_max = 64;

fly_hsp = 0;
fly_sp = 1.5;
fly_change_count = 0;
dothud = false;

// drive variables
frict = 0.05;
og_frict = frict;
air_resistance = 0;

// jump variables
dir = -1;
current_state = POLYSTATES.IDLE;
current_fly_state = FLYSTATES.NOT;

// decide hp
if (global.difficulty == 1) {
	hp = 12;
	hp_original = 12;
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
	
	var not_easy = global.difficulty > 0;
	
	if (phase > 0 and (fly_tick == -1 or fly_tick >= fly_tick_target) and not_easy) {
		fly();
	}	
	
	else if ((x < left_bound + 96 or x > right_bound - 96) and not_easy) {
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
	
	if (phase > 0) {
		fly_tick++;
	}
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

fly = function() {
	frict = 0;
	
	current_state = POLYSTATES.FLYING;
	current_fly_state = FLYSTATES.BASIC;
	obey_gravity = false;
	sprite_index = SICarFly;
	
	fly_tick = 0;
	fly_tick_target = irandom_range(2, 6);
	fly_change_count = 0;
	
	fly_chose_new_target();
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
	
	var right_end = dir == 1 and x > 1160;
	var left_end = dir == -1 and x < 1650;		
	
	if (left_end or right_end) {
		move = 0;
		end_attack();
	}
}

chose_fly_xrange = function() {
	if (x > right_bound - fly_xrange) {
		return [right_bound - fly_xrange, right_bound];
	}
	
	else if (x < left_bound + fly_xrange) {
		return [left_bound, left_bound + fly_xrange];
	}
	
	var rad = fly_xrange / 2;
	return [x - rad, x + rad];
}

fly_hit_target = function() {
	return abs(x - fly_x_target) < 8 and abs(y - fly_y_target) < 8;
}

fly_chose_new_target = function() {
	fly_change_count++;
	fly_y_target = max(fly_y_target_max, y - 64);
	
	var xrange = chose_fly_xrange();
	fly_x_target = random_range(xrange[0], xrange[1]);
	
	var dx = fly_x_target - x;
	var dy = fly_y_target - y;
	var hyp = sqrt(dx * dx + dy * dy);
	
	hsp = (dx / hyp) * fly_sp;
	vsp = (dy / hyp) * fly_sp;
	
	dir = sign(hsp);
	fly_hsp = hsp;
}

should_end_fly = function() {
	
	if (current_fly_state == FLYSTATES.BASIC and fly_change_count > 9) {
		return true;
	}
	
	return false;
}

fly_step = function() {
	if (should_end_fly()) {
		frict = og_frict;
		obey_gravity = true;
		dothud = true;
		vsp = 9;
		current_fly_state = FLYSTATES.NOT;
		end_attack();
		return;
	}
	
	if (fly_hit_target()) {
		fly_chose_new_target();
	}
	
	if (y < fly_y_target_max and vsp != 0) {
		vsp = 0;
	}
}

stop_shake = function() {
	global.lo.send(TOGGLE_SHAKE, false);
}

attack_timer = time_source_create(time_source_game, 1, time_source_units_seconds, chose_attack);
shake_timer = time_source_create(time_source_game, 0.2, time_source_units_seconds, stop_shake);
