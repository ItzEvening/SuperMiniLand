// following the laws of physics
obey_gravity = true;
obey_collisions = true;
inertial = true;

// physics properties
walksp = 5;
flysp = 5;
walkstr = 0.05;
hsp = 0;

// stuff
move = 0;
v_move = 0;

grv = 0.2;
vsp = 0;
jump_strength = -3;
jump_strength_water = -6;
buoyancy = 4;

frict = 0.3;
air_resistance = 0.3
air_control = 0.05;
water_damp_constant_weak = 0.95;
water_damp_constant = 0.8;
water_damp_threshold = 8;

// for underwater audio effect
was_underwater = false;

// for walkers/cars
must_grounded = false;

// tileset
ground_tiles = layer_tilemap_get_id("Foreground_Tiles");
water_tiles = layer_tilemap_get_id("Water");
rail_tiles = undefined;

if (layer_exists("Rails")) {
	rail_tiles = layer_tilemap_get_id("Rails");
}


// collisions
ignore_drill_blocks = false;

// create the barriers
left_barrier = 0;
right_barrier = room_width;

// solids lol
solids = [ground_tiles, SolidObject];
if (layer_exists("Rails")) {
	array_push(solids, rail_tiles);
}

nudged = false;

max_out_speed = function(_damp) {	
	var _input_speed = hsp + move * _damp;
	var _friction_speed = sign(hsp) * (abs(hsp) - walksp * frict);
	
	
	// If player's input slows down speed faster
	if (abs(_input_speed) < abs(_friction_speed)) {
		return _input_speed;
	}
	
	// Friction wins
	return _friction_speed;
}

player_move = function(damp, _touching_ground) {
	var new_hsp = hsp;
	var delta_hsp = walksp * damp * move;
			
	new_hsp += delta_hsp;
			
	// If horizontal speed exceeds absolute maximum
	if (abs(new_hsp) >= walksp) {
		hsp = walksp * move;
	}
	// If player input attempts to accelerate to
	// maximum fly speed
	else if (abs(hsp) <= flysp and abs(new_hsp) >= flysp and !_touching_ground) {
		hsp = flysp * move;
	}
	// Player input does not exceed maximum speed
	else {
		hsp = new_hsp
	}
}

horizontal_acceleration = function(_touch_ground, _touch_rail) {
	var damp = frict;
	
	if (!_touch_ground and !_touch_rail) 
	{
		if (move != 0) {
			damp = air_control;
		}
		
		else {
			damp = air_resistance;
		}
		
	}
	
	else if (_touch_ground and move != 0) {
		damp = walkstr;
	}
	
	return damp;
}

calculate_speeds = function(_underwater) 
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
		var _grv = grv;
		if (_underwater) {
			_grv /= buoyancy;
		}
		vsp = vsp + _grv;
	}
	if (_underwater)
	{
		var _d = water_damp_constant;
		
		if (abs(vsp) < water_damp_threshold) {
			_d = water_damp_constant_weak;
		}
		vsp *= _d;
		
		if (v_move < 0) {
			vsp += 0.5;
		}
	}
	
	// Sets damp constant for horizontal velocity
	var damp = horizontal_acceleration(_touching_ground, _touching_rail);
	
	
	// If player input not on rail
	if (move != 0 and !_touching_rail) {
		// prevents exceeding max or min speeds
		if (abs(hsp) > walksp) {
		    hsp = max_out_speed(damp);
		}
		
		// accelerate to maximum speed allowed
		else {
			player_move(damp, _touching_ground);
		}
	}


	// If touching rail...
	else if (_touching_rail) {
		var _direction = move;
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
		var delta_hsp = walksp * damp;
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
	var _barrier_collide = (x + hsp <= left_barrier) or (x + hsp >= right_barrier);
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
	
	
	// Inertial check
	if (!inertial) {
		hsp = 0;
		vsp = 0;
	}
}

function colliding_now(_axis) 
{
	if (_axis == "x")
	{
		if (meeting_solid(x + sign(hsp), y)) {
			return true;
		}
		
		// barriers
		if ((x + sign(hsp) <= left_barrier) or (x + sign(hsp) >= right_barrier))
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

nudge = function(_dx, _dy) {
	x += _dx;
	y += _dy;
}

unsquish = function() {
	
	for (var i = 1; i <= 16; i++) {
		
		// up
		if (!meeting_solid(x, y - i)) {
			y -= i;
			// show_debug_message("Moving up by " + string(i));
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