// You can write your code in this editor
event_inherited();

//// physics properties
walksp = 9.5;
walkstr = 0.01
air_resistance = 0.1;
frict = 0.3;

// sprites
idle = Mini_Hedge_Idle
fall = Mini_Hedge_Jump
run = Mini_Hedge_Run_Slow

booster = Mini_Hedge_Run_Fast

// small
hp_default = 4;
hp = hp_default;

boost_default = 0;
boost = boost_default;
boosted = false;

 delta_x = 0;
 delta_y = 0;
 dash_speed = 17;
// forcefield
forcefield = noone;

manage_animations = function(_midair)
{
	// If drilling
	if (_midair and done_gimmick and boosted) {
		image_speed = 1;
		sprite_index = M_Mini_Dash;
	}
     else if (_midair and done_gimmick) {
		image_speed = 1;
		sprite_index = Mini_Hedge_Jump;
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
		image_speed = 1;
		if (hsp == 0)
		{
			sprite_index = idle;
		}
		else if (hsp == 9.5 or hsp == -9.5)
		{
			sprite_index = booster;
		}
		else
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