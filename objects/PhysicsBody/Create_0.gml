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
	var _solids = [ground_tiles, SolidObject];
	
	if (layer_exists("Rails")) {
		array_push(_solids, rail_tiles);
	}

	for (var i = 0; i < array_length(_solids); i++) {
		
		if (place_meeting(_x, _y, _solids[i])) {
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

