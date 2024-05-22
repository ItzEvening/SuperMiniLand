// Key Stuffs
var _hit_left = keyboard_check(key_left);
var _hit_right = keyboard_check(key_right); 
var _hit_jump = keyboard_check(key_jump);

// Physics Stuffs
var _midair = !place_meeting(x,y+1,ground_tiles);
var _move = _hit_right - _hit_left;
var _underwater = place_meeting(x,y,water_tiles);

calculate_speeds(_move, _midair, _underwater);

// Underwater effect
if (_underwater and !was_underwater) or (!_underwater and was_underwater)
{
	MusicPlayer.underwater_effect(was_underwater);
	was_underwater = !was_underwater;
}

// Jump Stuffs
if (!_midair) and (_hit_jump)
{
	if (!_underwater) vsp = jump_strength;
	else vsp = jump_strength_water;
}
 
manage_collisions();

manage_animations(_midair);