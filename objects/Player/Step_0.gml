// Key Stuffs
var _hit_left = keyboard_check(key_left);
var _hit_right = keyboard_check(key_right); 
var _hit_jump = keyboard_check(key_jump);

var _midair = !place_meeting(x,y+1,ground_tiles);
var _move = _hit_right - _hit_left;
var _underwater = place_meeting(x,y,water_tiles);


calculate_speeds(_move, _midair, _underwater);

// Jump Stuffs
if (!_midair) and (_hit_jump)
{
    vsp = jump_strength;
}
 
manage_collisions();

manage_animations(_midair);