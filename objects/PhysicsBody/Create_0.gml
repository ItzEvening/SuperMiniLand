// following the laws of physics
obey_gravity = true;
obey_collisions = true;

// physics properties
walksp = 5;
walkstr = 0.05;
hsp = 0;

grv = 0.2;
vsp = 0;

jump_strength = -3;
jump_strength_water = -13;

frict = 0.3;
air_resistance = 0.05;
water_damp_constant = 0.12;

// for underwater audio effect
was_underwater = false;

// for walkers/cars
must_grounded = false;

// tileset
ground_tiles = layer_tilemap_get_id("Foreground_Tiles");
water_tiles = layer_tilemap_get_id("Water");
rail_tiles = layer_tilemap_get_id("Rails");

// collisions
ignore_drill_blocks = false;

// create the barriers
left_barrier = instance_create_layer(0, y, layer, o_barrier_left);
right_barrier = instance_create_layer(room_width, y, layer, o_barrier_right);

// solids lol
solids = [ground_tiles, SolidObject];
if (layer_exists("Rails")) {
	array_push(solids, rail_tiles);
}

// moving platforms
grounded_solid = noone;
gs_dx = 0;
gs_dy = 0;

calculate_speeds = function(_move, _underwater) 
{
	// Initializes collision variables
	var _g = sign(grv)
	
	var _touching_ground = place_meeting(x,y + _g,ground_tiles);
	var _touching_rail = false
	if (!is_undefined(rail_tiles)) {
		_touching_rail = place_meeting(x,y + _g,rail_tiles);
	}
	
	// Sets vertical speed
	if (obey_gravity) {
		vsp = vsp + grv;
	}
	if (_underwater)
	{
		vsp = vsp - water_damp_constant * vsp;
	}
	
	
	// prevents player from being launched upwards when emerging from water
	else if (was_underwater and vsp < jump_strength) 
	{
		vsp = jump_strength;
	}
	

	// Sets damp constant for horizontal velocity
	var damp = frict;
	if (!_touching_ground and !_touching_rail) 
	{
	    damp = air_resistance;
	}
	else if (_touching_ground and _move != 0) {
		damp = walkstr;
	}
	
	
	// If player input not on rail
	if (_move != 0 and !_touching_rail) {


		// prevents exceeding max or min speeds
		if (hsp > walksp) {
		    hsp -= walksp * frict;
		}
		else if (hsp < walksp * -1) {
		    hsp += walksp * frict;
		}
		
		
		else {
			var new_hsp = hsp;
			var delta_hsp = walksp * damp * _move;
			
			new_hsp += delta_hsp;
			
			if (abs(new_hsp) <= walksp) {
				hsp = new_hsp
			}
			else {
				hsp = walksp * _move;
			}
		}
	}


	// If touching rail...
	else if (_touching_rail) {
		var _direction = _move;
		if (_direction == 0 and hsp != 0) {
			_direction = sign(hsp);
		}
		else if (_direction = 0) {
			_direction = 1;
		}
		
		hsp = 7.5 * _direction;
	}
	
	// If stationary but not on rail
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

meeting_solid = function(_x, _y) {
	
	// assumption: solid objects should not overlap
	for (var i = 0; i < array_length(solids); i++) {
		
		if (place_meeting(_x, _y, solids[i])) {
			return true;
		}
	}
	
	if (place_meeting(_x, _y, DrillOnlyBox) and !ignore_drill_blocks) {
		return true;
	}
	
	return false;
}

function manage_collisions()
{
	if (!obey_collisions) {
		x += hsp;
		y += vsp;
		
		return;
	}
	
	// Horizontal collisions
	var _barrier_collide = (x + hsp <= o_barrier_left.x) or (x + hsp >= o_barrier_right.x);
	var _grounded_check = !must_grounded or meeting_solid(x + hsp, y + 1);
	
	if (meeting_solid(x + hsp, y) or _barrier_collide or !_grounded_check) 
	{
		
	    while (!colliding_now("x"))
	    {
	        x = x + sign(hsp);
	    }
		
	    hsp = 0;
	}
	
	x = x + hsp;
	
	// Vertical collisions
	
	if (meeting_solid(x, y + vsp))
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
		if (meeting_solid(x + sign(hsp), y)) {
			return true;
		}
		
		// barriers
		if ((x + sign(hsp) <= o_barrier_left.x) or (x + sign(hsp) >= o_barrier_right.x))
		{
			return true;
		}
		
		if (must_grounded and !meeting_solid(x + sign(hsp), y + 1)) {
			return true;
		}
	}
	else
	{		
		if (meeting_solid(x, y + sign(vsp))) {
			return true;
		}
	}
	
	return false;
}

water_stream_callback = function() {
	vsp = 7 * sign(grv);
}

recheck_grounded_solid = function() {
	if (place_meeting(x, y + sign(grv), SolidObject)) {
		
		if (grounded_solid == noone) {
			show_debug_message("Found gso. " + string(dbg));
			dbg++;
		}
		
		grounded_solid = instance_place(x, y + sign(grv), SolidObject);
		gs_dx = grounded_solid.x;
		gs_dy = grounded_solid.y;
		
	} else {
		
		if (grounded_solid != noone) {
			show_debug_message("No more gso. Disengaging "  + string(dbg));
			dbg++;
		}
		
		grounded_solid = noone;
		gs_dx = 0;
		gs_dy = 0;
	}
}

move_with_grounded_solid  = function() {
	if (grounded_solid != noone) {
		gs_dx = grounded_solid.x - gs_dx;
		gs_dy = grounded_solid.y - gs_dy;
		
		x += gs_dx;
		y += gs_dy;
	}
	
	// grounded_solid = noone;
	gs_dx = 0;
	gs_dy = 0;
}

unsquish = function() {
	
	for (var i = 1; i <= 16; i++) {
		
		// up
		if (!meeting_solid(x, y - i)) {
			y -= i;
			show_debug_message("Moving up by " + string(i));
			return;
		}
		
		// right
		if (!meeting_solid(x + i, y)) {
			// show_debug_message("Moving right by " + string(i));
			x += i;
			return;
		}
		
		// down
		if (!meeting_solid(x, y + i)) {
			// show_debug_message("Moving down by " + string(i));
			y += i;
			return;
		}
		
		// left
		if (!meeting_solid(x - i, y)) {
			// show_debug_message("Moving left by " + string(i));
			x -= i;
			return;
		}
		
	}
}