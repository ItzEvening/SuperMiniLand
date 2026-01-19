// You can write your code in this editor
event_inherited();

//// physics properties
walksp = 9.5;
walkstr = 0.01
air_resistance = 0.1;
frict = 0.3;

// sprites
idle = M_Mini_Idle
idle_impatient = M_Mini_Idle_Full
fall = M_Mini_Jump_Fall
run = M_Mini_Run

time_source_reconfigure(idle_timer, 15, time_source_units_seconds, idle_trigger);
time_source_start(idle_timer);

booster = M_Mini_Boost

// small
hp_default = 7;
hp = hp_default;

boost_default = 0;
boost = boost_default;
boosted = false;
// forcefield
forcefield = noone;

character_specific_animations = function(_midair)
{
	if (_midair and done_gimmick and boosted) {
		anim_speed = 1;
		anim = M_Mini_Dash;
		anim_frame = -1;
	}
	else if (_midair and done_gimmick) {
		anim_speed = 1;
		anim = M_Mini_Dash_Empty;
		anim_frame = -1;
	}
	else if (!_midair and abs(hsp) > 10) {
		anim_speed = 1;
		anim = M_Mini_Boost;
		anim_frame = -1;
	}
}