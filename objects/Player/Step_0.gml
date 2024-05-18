// Key Stuffs
var _hit_left = keyboard_check(key_left);
var _hit_right = keyboard_check(key_right); 
var _hit_jump = keyboard_check_pressed(key_jump);

var _midair = !place_meeting(x,y+1,ground_tiles);
var _move = _hit_right - _hit_left;


calculate_speeds(_move, _midair);

// Jump Stuffs
if (!_midair) and (_hit_jump)
{
    vsp = jump_strength;
}
 
manage_collisions();
x = x + hsp;
y = y + vsp;

manage_animations(_midair);