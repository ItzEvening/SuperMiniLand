event_inherited();

manage_animations = function(_midair)
{
	// If dashing
	if (_midair and done_gimmick) {
		image_speed = 1;
		sprite_index = Mini_Dash;
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