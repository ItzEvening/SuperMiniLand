event_inherited();

#region controlfunctions

hit_left = function() {
	return keyboard_check(vk_left) or 
	keyboard_check(ord("A")) or 
	Gamepad.get_joystick_horizontal() < 0;
}

hit_right = function() {
	return keyboard_check(vk_right) or 
	keyboard_check(ord("D")) or 
	Gamepad.get_joystick_horizontal() > 0;
}

hit_down = function() {
	return keyboard_check(vk_down) or 
	keyboard_check(ord("S")) or 
	Gamepad.get_joystick_vertical() < 0;	
}

hit_jump_release = function() {
	return keyboard_check_released(vk_space) or 
	keyboard_check_released(ord("W")) or 
	Gamepad.get_jump_released();
}

hit_jump = function() {
	return keyboard_check_pressed(vk_space) or 
	keyboard_check_pressed(ord("W")) or 
	Gamepad.get_jump();
}

hit_jump_hold = function() {
	return keyboard_check(vk_space) or 
	keyboard_check(ord("W")) or 
	Gamepad.get_jump_hold();
}

any_released = function() {
	var _any_released = false;
	
	for (var i = 0; i < array_length(keys); i++) {
		_any_released = _any_released or keyboard_check_released(keys[i]);
	}
	
	_any_released = _any_released or Gamepad.get_joystick_release();
	_any_released = _any_released or Gamepad.get_jump_released();
   
	return _any_released;
}

any_pressed = function() {
	var _any_pressed = false;
	
	for (var i = 0; i < array_length(keys); i++) {
		_any_pressed = _any_pressed or keyboard_check(keys[i]);
	}	
	
	_any_pressed = _any_pressed or Gamepad.get_jump();
	_any_pressed = _any_pressed or Gamepad.get_joystick_horizontal() != 0;
	
	return _any_pressed;
}

#endregion

#region functions

// iframe functions
reset_iframe = function() {
	time_source_reset(iframe_timer);
	time_source_reset(blink_timer);
	
	time_source_start(iframe_timer);
	time_source_start(blink_timer);
	invincible = true;
}

expire_iframe = function() {
	invincible = false;
	visible = true;
}

blink_iframe = function() {
	visible = !visible;
}

change_visibility = function() {
	show_chances = !show_chances;
	livesicon.set_show_chances(show_chances);
}

// life functions
change_life = function(_delta) {
	
	if (hp + _delta < 0 or (global.difficulty == 2 and _delta < 0)) {
		handle_death();
	}
	
	else {
		hp += _delta;
		hpgui.lifetoframe(hp);
	}
	
	if (_delta < 0) {
		reset_iframe();
	}
}

// animation function
manage_animations = function(_midair) {
	//Animation Stuffs
	if (_midair)
	{
	    anim = fall;
	    anim_speed = 0;
	if (sign(vsp) == sign(grv)) anim_frame = 1; else anim_frame = 0;
	}
	else
	{
		anim_speed = 1;
		if (hsp == 0 and !(sprite_index == idle or sprite_index == idle_impatient))
		{
			anim = idle;
		}
		else if (hsp != 0)
		{
			anim = run;
		}
	}
	if (hsp != 0)
	{
		image_xscale = sign(hsp);
	}
	
	character_specific_animations(_midair);
	
	if (anim != noone) {
		sprite_index = anim;
		image_speed = anim_speed;
		
		if (anim_frame != -1) {
			image_index = anim_frame;
		}
	}
	
	anim = noone;
	anim_frame = -1;
}

character_specific_animations = function(_midair) {
	// to be overwritten
}

// death function
handle_death = function() {
	
	// player won't die if level is completed
	if (level_completed) {
		return;
	}
	
	if (chances == 0 and global.difficulty != 0)
	{
		game_over();
	}
	else if (chances == 1)
	{
		time_source_start(icon_blink_timer);
	}
	
	if (chances > 0 and global.difficulty != 0) {
		chances--;
		
	}
	
	hp = hp_default;
	hpgui.lifetoframe(hp);

	if (alive) {
		x = original_x;
		y = original_y;
		hsp = 0;
		vsp = 0;
	}
	
	// handle gravity
	grv = original_g;
	image_yscale = sign(grv);
	
	reset_iframe();
	reset_animations();
	
	global.lo.send(PLAYER_DEATH,);
}

// reset animations
reset_animations = function() {
	// to be overwritten
}

// game over function
game_over = function() {
	hascontrol = false;
	alive = false;
	
	SlideTransition(TRANS_MODE.GOTO, GameOverDestination());
}

// gimmick function
enable_gimmick = function() {
	can_gimmick = true;
}

// to activate impatient idle animation
idle_trigger = function() {
	if (!patient) {
		sprite_index = idle_impatient;
	}
	
}

// crushing hazard
crush = function() {
	if (meeting_solid(x, y)) {
		unsquish();
	
		if (meeting_solid(x, y)) {
			audio_play_sound(Damage, 10, 0);
			handle_death();
		}
	}
}

calc_jump_velocity = function(_underwater) {	
	return jump_init + jump_acceleration * jump_time;
}

calc_ref_frame_velocity = function(_axis) {
	var _platform = instance_place(x, y + sign(grv), MovingTile);
	
	if (_platform == noone) {
		return 0;
	}
	
	return _platform.find_speed(_axis);
}
#endregion

#region variables

patient = false;

hascontrol = true; 
level_completed = false;

// original position for respawn
original_x = x;
original_y = y;
original_g = grv;

// lives stuff
chances = DecideLifeCount();
alive = true;
show_chances = true;

// sprites
idle = Mini_Idle
fall = Mini_Jump_Fall
run = Mini_Run2

coins = 0;

invincible = false;
iframe_timer = time_source_create(time_source_game, 2, time_source_units_seconds, expire_iframe);
blink_timer = time_source_create(time_source_game, 0.2, time_source_units_seconds, blink_iframe, [], 8);
icon_blink_timer = time_source_create(time_source_global, 0.75, time_source_units_seconds, change_visibility, [], -1);

hp_default = 3;
hp = hp_default;

boost_default = 1;
boost = boost_default;

// create font stuff
var _lives_struct = {xDraw: 140, yDraw: 800, scale: 0.75};
livesFont = instance_create_layer(0, 0, "Instances", FontDrawer, _lives_struct);
livesText = "";

var _coins_struct = {xDraw: 72, yDraw: 45, scale: 0.6, drawCoin: true};
coinsFont = instance_create_layer(0, 0, "Instances", FontDrawer, _coins_struct);

// create the lives icon
livesicon = instance_create_layer(0, 0, "Instances", LivesIcon);
livesicon.init(object_index);

//create HP GUI
hpgui = instance_create_layer(0, 0, "Instances", GUI_HP);
hpgui.init(object_index);

// create the rainbow gem gui
rainbow = instance_create_layer(0, 0, "Instances", RainbowGUI);

// gimmick variables
done_gimmick = false;
can_gimmick = false;
gimmick_timer = time_source_create(time_source_global, 0.1, time_source_units_seconds, enable_gimmick);

// jumping variables
released_jump = true;
jump_acceleration = -0.34;
jump_init_default = -2;
jump_init = jump_init_default;
jump_time = 0;
jump_time_max = 11;

// for idle animation
idle_impatient = Mini_Idle_Full;
idle_timer = time_source_create(time_source_global, 10, time_source_units_seconds, idle_trigger);

// any keys read by player
keys = [vk_space, vk_left, vk_right, ord("W"), ord("A"), ord("S"), ord("D")];

anim = noone;
anim_speed = 1;
anim_frame = -1;

silent = false;
#endregion

time_source_start(idle_timer);