// physics properties
walksp = 4;
grv = 0.2;
vsp = 0;
hsp = 0;
jump_strength = -6.5;
jump_strength_water = -13;
frict = 0.3;
air_resistance = 0.05;
water_damp_constant = 0.12;

// for underwater audio effect
was_underwater = false;

// tileset
ground_tiles = layer_tilemap_get_id("Foreground_Tiles");
water_tiles = layer_tilemap_get_id("Water");

// create the barriers
left_barrier = instance_create_layer(0, y, layer, o_barrier_left);
right_barrier = instance_create_layer(room_width, y, layer, o_barrier_right);

function calculate_speeds(_move, _midair, _underwater) 
{
	// Sets vertical speed
    vsp = vsp + grv;
	
	if (_underwater)
	{
		vsp = vsp - water_damp_constant * vsp;
	}
	// prevents player from being launched upwards when emerging from water
	else if (was_underwater and vsp < jump_strength) 
	{
		vsp = jump_strength;
	}

	var damp = frict;
	// If midair
	if (_midair) 
	{
	    damp = air_resistance;
	}
	
	// If walking on ground
	if (_move != 0)
	{
	    var delta_hsp = walksp * damp * _move;
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
	var _tile_collide_x = place_meeting(x + hsp, y, ground_tiles);
	var _barrier_collide = place_meeting(x + hsp, y, o_barrier_left) or place_meeting(x + hsp, y, o_barrier_right);
	
	if (_tile_collide_x or _barrier_collide) 
	{
		
	    while (!colliding_now("x"))
	    {
	        x = x + sign(hsp);
	    }
		
	    hsp = 0;
	}
	x = x + hsp;
	
	// Vertical collisions
	var _tile_collide_y = place_meeting(x, y + vsp, ground_tiles);
	
	if (_tile_collide_y)
	{
	    while (!colliding_now("y"))
	    {
	        y = y + sign(vsp);
	    }
		
	    vsp = 0;
	}
	y = y + vsp;
}

function colliding_now(_axis) 
{
	if (_axis == "x")
	{
		// tiles
		if (place_meeting(x + sign(hsp), y, ground_tiles))
		{
			return true;
		}
		
		// barriers
		else if (place_meeting(x + sign(hsp), y, o_barrier_left) or place_meeting(x + sign(hsp), y, o_barrier_right))
		{
			return true;
		}
	}
	else
	{
		if (place_meeting(x, y + sign(vsp), ground_tiles))
		{
			return true;
		}
	}
	
	return false;
}

