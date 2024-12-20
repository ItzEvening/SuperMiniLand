// Key Stuffs
var _hit_left = 0;
var _hit_right = 0;
var _hit_jump = 0;

if (hascontrol)
{
   _hit_left = keyboard_check(vk_left) or keyboard_check(ord("A"));
   _hit_right = keyboard_check(vk_right) or keyboard_check(ord("D")); 
   _hit_jump = keyboard_check(vk_space) or keyboard_check(ord("W")); 
   
   //Do you want me to do Gamepad stuffs?
}


// Physics Stuffs
var _midair = !place_meeting(x,y+1,ground_tiles) and !place_meeting(x,y+1,rail_tiles);
var _move = _hit_right - _hit_left;
var _underwater = place_meeting(x,y,water_tiles);

calculate_speeds(_move, _underwater);

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
	
	time_source_start(gimmick_timer);
}

// reenable gimmick
if (!_midair) {
	done_gimmick = true;
}
 
manage_collisions();

left_barrier.y = y;
right_barrier.y = y;

manage_animations(_midair);

// Coin stuff
var _coin = instance_place(x, y, Coin);
if (_coin != noone)
{
	instance_destroy(_coin);
	coins++;
	audio_play_sound(CoinGot, 10, 0);
}

var _coinr = instance_place(x, y, CoinR);
if (_coinr != noone)
{
	instance_destroy(_coinr);
	coins++;
	audio_play_sound(CoinGotR, 10, 0);
}

if (y > room_height + 50)
{
	handle_death();
}