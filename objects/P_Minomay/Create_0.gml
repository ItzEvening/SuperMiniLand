// You can write your code in this editor
event_inherited();

//// physics properties
walksp = 6.5;
walkstr = 0.01
air_resistance = 0.1;
frict = 0.3;
floating_grv = 0.1;

// sprites
idle = Mino_Idle
idle_impatient = Mino_Idle_Full
fall = Mino_Jump
run = Mino_Run

booster = Mino_Spin_Power

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
	// If drilling
	if (_midair and done_gimmick and boosted) {
		anim_speed = 1;
		anim_frame = -1;
		anim = Mino_Spin_Power;
			
	}
	else if (_midair and done_gimmick) {
		anim_speed = 1;
		anim_frame = -1;
		anim = Mino_Spin;
	}
}