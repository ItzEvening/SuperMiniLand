// Key Stuffs
key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right); 
key_jump = keyboard_check_pressed(vk_space);

var move = key_right - key_left;
var midair = !place_meeting(x,y+1,Object2);
var frict = 0.1;

// Move Stuffs
vsp = vsp + grv;
if (midair) 
{
    hsp = move * walksp * 0.5;
}
else if (move != 0)
{
    var delta_hsp = walksp * frict * move;
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

// Jump Stuffs
if (!midair) and (key_jump)
{
    vsp = -7
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
if (!place_meeting(x,y+1,Object2))
{
    sprite_index = Eve_Jump_Fall;
    image_speed = 0;
if (sign(vsp) > 0) image_index = 1; else image_index = 0;
}
else
{
	image_speed = 1;
	if (hsp == 0)
	{
		sprite_index = Eve_Idle;
	}
	else
	{
		sprite_index = Eve_Run;
	}
}