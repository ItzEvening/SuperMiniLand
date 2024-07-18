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
hascontrol = true; 

// for underwater audio effect
was_underwater = false;

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
water_tiles = layer_tilemap_get_id("Water");

// create the barriers
left_barrier = instance_create_layer(0, y, layer, o_barrier_left);
right_barrier = instance_create_layer(room_width, y, layer, o_barrier_right);

// original position
original_x = x;
original_y = y;

// lives stuff
chances = 99;
show_chances = true;

coins = 0;

// create font stuff
var _lives_struct = {xDraw: 140, yDraw: 800, scale: 0.75};
livesFont = instance_create_layer(0, 0, "Instances", FontDrawer, _lives_struct);

var _coins_struct = {xDraw: 25, yDraw: 45, scale: 0.6, drawCoin: true};
coinsFont = instance_create_layer(0, 0, "Instances", FontDrawer, _coins_struct);


change_visibility = function()
{
	show_chances = !show_chances;
}

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

function handle_death()
{
	if (y > room_height + 50)
	{
		if (chances == 0)
		{
			room_goto(Game_Over);
		}
		else if (chances == 1)
		{
			timer = time_source_create(time_source_global, 0.75, time_source_units_seconds, change_visibility, [], -1);
			time_source_start(timer);
		}
		chances--;
		x = original_x;
		y = original_y;
		hsp = 0;
		vsp = 0;
		
	}
}