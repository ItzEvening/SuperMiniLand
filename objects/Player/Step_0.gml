// Key Stuffs
var _hit_left = 0;
var _hit_right = 0;
var _hit_jump_release = 0;
var _hit_jump = 0;

if (hascontrol)
{
   _hit_left = keyboard_check(vk_left) or keyboard_check(ord("A"));
   _hit_right = keyboard_check(vk_right) or keyboard_check(ord("D")); 
   _hit_jump_release = keyboard_check_released(vk_space) or keyboard_check_released(ord("W")); 
   _hit_jump = keyboard_check_pressed(vk_space) or keyboard_check_pressed(ord("W")); 
   
   //Do you want me to do Gamepad stuffs?
}


// Physics Stuffs
var _midair = !meeting_solid(x, y + 1);
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
	audio_play_sound(sfx_Jump,10,0);
	
	released_jump = false;
	time_source_start(jump_timer);
	
	if (!_underwater) vsp = jump_strength;
	else vsp = jump_strength_water;
}
else if (!released_jump) {
	vsp -= jump_resist;
}

// Release the jump
if (_hit_jump_release and !released_jump) {
	time_source_stop(jump_timer);
	released_jump = true;
}


// handle gimmick
if (!_midair) {
	done_gimmick = false;
	can_gimmick = false;
}
else if (!done_gimmick and !can_gimmick) {
	time_source_start(gimmick_timer);
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
if (_coinr != noone and !_coinr.collected)
{
	coins++;
	_coinr.collect();
}

var _coind = instance_place(x, y, CoinD);
var _valid_coin = (_coind != noone) and _coind.activated;
var _valid_state = (object_index == Mini) and done_gimmick;

if (_valid_coin)
{ 
	_coind.activated = false;
	_coind.visible = false;
	time_source_start(_coind.timer);
	
	audio_play_sound(CoinGot, 10, 0);
	
	if (!_coind.collected) {
		coins++;
	}
	
	
	if (_valid_state) {
		hsp = 17.5 * image_xscale;
		vsp = -0.5;
	}
}

if (y > room_height + 50)
{
	handle_death();
}