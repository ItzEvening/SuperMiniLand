// Key Stuffs
var _hit_left = keyboard_check(key_left);
var _hit_right = keyboard_check(key_right); 
var _hit_jump = keyboard_check_pressed(key_jump);

var _move = _hit_right - _hit_left;
var _midair = !place_meeting(x,y+1,Object2);
var _frict = 0.1;

// Move Stuffs
vsp = vsp + grv;
if (_midair) 
{
    hsp = _move * walksp * 0.5;
}
else if (_move != 0)
{
    var delta_hsp = walksp * _frict * _move;
    hsp = hsp + delta_hsp;

    // prevents exceeding max or min speeds
    if (hsp > walksp) {
        hsp = walksp;
    }
    else if (hsp < walksp * -1) {
        hsp = walksp * -1
    }
}
else
{
    var delta_hsp = walksp * _frict;
    var sign_hsp = sign(hsp);
    hsp = abs(hsp);

    hsp = hsp - delta_hsp;

    if (hsp < 0)
    {
        hsp = 0;
    }

    hsp = hsp * sign_hsp
}

// Jump Stuffs
if (!_midair) and (_hit_jump)
{
    vsp = jump_strength;
}
 
 // Walk Stuffs
if (place_meeting(x+hsp,y,Object2))
{
    while (!place_meeting(x+sign(hsp),y,Object2))
    {
        x = x + sign(hsp);
    }
    hsp = 0;
}
x = x + hsp;

// More Jump Stuffs
if (place_meeting(x,y+vsp,Object2))
{
    while (!place_meeting(x,y+sign(vsp),Object2))
    {
        y = y + sign(vsp);
    }
    vsp = 0;
}
y = y + vsp;

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