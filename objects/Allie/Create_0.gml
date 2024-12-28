// You can write your code in this editor
event_inherited();

//// physics properties
walksp = 6.5;
walkstr = 0.03
air_resistance = 0.1;
frict = 0.3;

// sprites
idle = Allie_Idle
fall = Allie_Jump_Fall
run = Allie_Run
hpgui.sprite = HP_Player_Al

// small
hp_default = 2;
hp = hp_default;

// forcefield
forcefield = noone;

manage_animations = function(_midair)
{
	// If drilling
	if (_midair and done_gimmick) {
		image_speed = 1;
		sprite_index = Allie_Drill;
	}
	
	//If midair but not dashing
	else if (_midair)
	{
	    sprite_index = fall;
	    image_speed = 0;
	if (sign(vsp) > 0) image_index = 1; else image_index = 0;
	
	
	}
	
	// If on ground
	else
	{
		image_speed = 1;
		if (hsp == 0)
		{
			sprite_index = idle;
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