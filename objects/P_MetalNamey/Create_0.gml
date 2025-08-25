// You can write your code in this editor
event_inherited();

//// physics properties
walksp = 9.5;
walkstr = 0.01
air_resistance = 0.1;
frict = 0.3;

// sprites
idle = M_Mini_Idle
fall = M_Mini_Jump_Fall
run = M_Mini_Run
booster = M_Mini_Boost
hpgui.sprite = HP_Player_M
hpgui.bear = false;

// small
hp_default = 8;
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
		sprite_index = M_Mini_Dash;
	}
	else if (_midair and done_gimmick) {
		image_speed = 1;
		sprite_index = M_Mini_Dash_Empty;
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
		else if (hsp > 10 or hsp == -15)
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