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

manage_animations = function(_midair)
{
	// If drilling
	if (_midair and done_gimmick and boosted) {
		image_speed = 1;
		sprite_index = Mino_Spin_Power;
		
		if (sign(vsp) == sign(grv)) {
			grv = floating_grv * sign(grv);
		}
		
	}
	else if (_midair and done_gimmick) {
		image_speed = 1;
		sprite_index = Mino_Spin;
	}
	//If midair but not dashing
	else if (_midair)
	{
	    sprite_index = fall;
	    image_speed = 0;
	if (sign(vsp) == sign(grv)) image_index = 1; else image_index = 0;
	
	
	}
	
	// If on ground
	else
	{
		grv = abs(original_g) * sign(grv);
		image_speed = 1;
		if (hsp == 0 and !(sprite_index == idle or sprite_index == idle_impatient))
		{
			sprite_index = idle;
		}
		else if (hsp != 0)
		{
			sprite_index = run;
		}
	}
	
	// Make Mini face the correct direction
	if (hsp != 0)
	{
		image_xscale = sign(hsp);
	}
}