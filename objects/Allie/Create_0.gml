// You can write your code in this editor
event_inherited();

//// physics properties
walksp = 6.5;
walkstr = 0.03
air_resistance = 0.1;
frict = 0.3;

// sprites
idle = Allie_Idle
idle_impatient = Allie_Idle_Full
fall = Allie_Jump_Fall
run = Allie_Run

time_source_reconfigure(idle_timer, 7, time_source_units_seconds, idle_trigger);
time_source_start(idle_timer);

// small
hp_default = 2;
hp = hp_default;

// forcefield
forcefield = noone;
perfect_hit = false;

// her special indicator
indicator = instance_create_depth(0, 0, 99, AllieIndicator);

// bouncy cooldown
bouncy_cooldown = 0;

character_specific_animations = function(_midair) {
	// If drilling
	if (_midair and done_gimmick) {
		if (perfect_hit) {
			anim_speed = 1;
			anim = Allie_Drill;
			anim_frame = -1;
			
		}
		else {
			anim_speed = 1;
			anim = Allie_Stomp;
			anim_frame = -1;
		}
	}
}

bounce = function(_enemy, _strength = 6.5) {
	var _center_x = (bbox_right + bbox_left) / 2;
	var _center_x_enemy = (_enemy.bbox_left + _enemy.bbox_right) / 2;
	var _dist_x = abs(_center_x - _center_x_enemy);
	
	var _is_bouncy = object_is_ancestor(_enemy.object_index, BouncyObject) or _enemy.object_index == BouncyObject;
	
	var _dist_good = _dist_x <= 20;
	var _speed_good = vsp <= 20.6 * sign(grv) or _is_bouncy;
	
	if (!_dist_good and !_speed_good) {
		global.lo.send(ALLIE_KILL, ALLIE_BAD);
	}
	else if (!_dist_good) {
		global.lo.send(ALLIE_KILL, ALLIE_OFF_BALANCE);
	}
	else if (!_speed_good) {
		global.lo.send(ALLIE_KILL, ALLIE_TOO_ROUGH);
	}
	
	else if (!_is_bouncy or bouncy_cooldown == 0) {
		vsp = -1 * _strength * sign(grv);	
		global.lo.send(ALLIE_KILL, ALLIE_GOOD);
		audio_play_sound(HeadStomped, 10, false);
		perfect_hit = true;
		
		if (_is_bouncy) {
			bouncy_cooldown = 10;
		}
	}
}