// physics properties
walksp = 4;
grv = 0.2;
vsp = 0;
hsp = 0;
jump_strength = -6;
frict = 0.1;

// keybinds
key_left = vk_left;
key_right = vk_right;
key_jump = vk_space;

// sprites
idle = Mini_Idle;
fall = Mini_Jump_Fall;
run = Mini_Run2;

// tileset
ground_tiles = layer_tilemap_get_id("Foreground_Tiles");

function calculate_speeds(_move, _midair) 
{
	// Sets vertical speed
	vsp = vsp + grv;
	
	// If midair
	if (_midair) 
	{
	    hsp = _move * walksp * 0.5;
	}
	
	// If walking on ground
	else if (_move != 0)
	{
	    var delta_hsp = walksp * frict * _move;
	    hsp = hsp + delta_hsp;

	    // prevents exceeding max or min speeds
	    if (hsp > walksp) {
	        hsp = walksp;
	    }
	    else if (hsp < walksp * -1) {
	        hsp = walksp * -1
	    }
	}
	
	// If idle on ground
	else
	{
	    var delta_hsp = walksp * frict;
	    var sign_hsp = sign(hsp);
	    hsp = abs(hsp);

	    hsp = hsp - delta_hsp;

	    if (hsp < 0)
	    {
	        hsp = 0;
	    }

	    hsp = hsp * sign_hsp
	}
}

function manage_collisions()
{
	 // Horizontal collisions
	if (place_meeting(x+hsp,y,ground_tiles)) 
	{
	    while (!place_meeting(x+sign(hsp),y,ground_tiles))
	    {
	        x = x + sign(hsp);
	    }
	    hsp = 0;
	}
	
	// Vertical collisions
	if (place_meeting(x,y+vsp,ground_tiles))
	{
	    while (!place_meeting(x,y+sign(vsp),ground_tiles))
	    {
	        y = y + sign(vsp);
	    }
	    vsp = 0;
	}
}

function manage_animations(_midair)
{
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