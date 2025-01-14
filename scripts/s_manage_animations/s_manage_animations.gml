// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function s_manage_animations(_midair){
	
	//Animation Stuffs
	if (_midair)
	{
	    sprite_index = fall;
	    image_speed = 0;
	if (sign(vsp) > 0) image_index = 1; else image_index = 0;
	}
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
	if (hsp != 0)
	{
		image_xscale = sign(hsp);
	}
}